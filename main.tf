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

  # Since you cannot delete the Vault, we will be charged
  # for backups until that date.

  # ch4n634bl3_f0r_d4y5 = 3
  max_retention_days = 14
  min_retention_days = 7
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
    }
  }

  tags = var.tags
}

module "kms" {
  source = "git::https://github.com/geekcell/terraform-aws-kms.git?ref=v1.0.0"
  alias  = "alias/backup"

  tags = var.tags
}
