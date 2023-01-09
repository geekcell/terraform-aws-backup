/**
 * # Terraform AWS Backup Module
 *
 * Terraform module which creates a Backup vault and plans attached to the vault.
 * The focus on this module lies within it's simplicity by providing default values
 * that should make sense for most use cases.
 */
resource "aws_backup_vault" "main" {
  name        = var.vault_name
  kms_key_arn = module.kms.key_arn

  tags = var.tags
}

resource "aws_backup_vault_lock_configuration" "main" {
  backup_vault_name = var.vault_name

  min_retention_days = var.min_retention_days
  max_retention_days = var.max_retention_days

  # When you apply these settings:
  #
  # The vault will become immutable in 3 days after applying.
  # You have 3 days of grace time to manage or delete the vault
  # lock before it becomes immutable. During this time, only
  # those users with specific IAM permissions can make changes.
  #
  # Once the vault is locked in compliance mode, it cannot be
  # managed or deleted by anyone, even the root user or AWS.
  # The only way to deactivate the lock is to terminate the account,
  # which will delete all the backups.
  #
  # Since you cannot delete the Vault, it will be charged
  # for backups until that date. Be careful!
  changeable_for_days = var.changeable_for_days
}

resource "aws_backup_selection" "main" {
  iam_role_arn = aws_iam_role.main.arn
  name         = "${var.vault_name}-backup"
  plan_id      = aws_backup_plan.main.id
  resources    = var.resources
}

resource "aws_backup_plan" "main" {
  name = var.backup_name

  dynamic "rule" {
    for_each = var.rules

    content {
      target_vault_name        = aws_backup_vault.main.name
      rule_name                = rule.value.name
      schedule                 = rule.value.schedule
      start_window             = rule.value.start_window
      completion_window        = rule.value.completion_window
      enable_continuous_backup = rule.value.enable_continuous_backup

      dynamic "lifecycle" {
        for_each = [true]

        content {
          delete_after       = rule.value.lifecycle.delete_after
          cold_storage_after = rule.value.lifecycle.cold_storage_after
        }
      }

      copy_action {
        destination_vault_arn = aws_backup_vault.main.arn
      }

      recovery_point_tags = {
        Name = rule.value.name
      }
    }
  }

  tags = merge(
    var.tags,
    {
      "ServiceType" = "backup"
    }
  )
}

resource "aws_iam_role" "main" {
  name        = "${var.vault_name}-backup"
  description = "This role is responsible for the backup in the Vault."

  assume_role_policy = data.aws_iam_policy_document.main.json
}

resource "aws_iam_role_policy_attachment" "main_backup" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = aws_iam_role.main.name
}

resource "aws_iam_role_policy_attachment" "main_restore" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForRestores"
  role       = aws_iam_role.main.name
}

resource "aws_iam_role_policy_attachment" "s3_backup" {
  policy_arn = "arn:aws:iam::aws:policy/AWSBackupServiceRolePolicyForS3Backup"
  role       = aws_iam_role.main.name
}

resource "aws_iam_role_policy_attachment" "s3_restore" {
  policy_arn = "arn:aws:iam::aws:policy/AWSBackupServiceRolePolicyForS3Restore"
  role       = aws_iam_role.main.name
}

module "kms" {
  source = "github.com/geekcell/terraform-aws-kms?ref=v1"

  alias = format("/%s/backup/vault/%s", var.service, var.vault_name)

  tags = var.tags
}
