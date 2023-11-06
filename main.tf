/**
 * # Terraform AWS Backup
 *
 * This Terraform module provides a preconfigured solution for setting up
 * AWS Backup in your AWS account. With this module, you can easily and
 * efficiently create and manage backups for your AWS resources. Our
 * team has extensive experience working with AWS Backup and has optimized
 * this module to provide the best possible experience for users.
 *
 * Using this Terraform module, you can save time and effort in setting up
 * and managing your backup policies, as well as avoid common mistakes and
 * pitfalls. The module encapsulates all necessary configurations, making
 * it easy to use and integrate into your existing AWS environment. Whether
 * you are looking to add backup protection for your critical resources or
 * streamline your existing backup processes, this Terraform module is a
 * great choice.
 */
locals {
  # Merge predefined rules with the passed rules. If the names of a predefined rule and a passed rule match,
  # the passed rule will take precedence and they will be merged.
  merged_rules = merge(
    { for rule in local.predefined_rules : rule.name => rule if contains(var.predefined_rules, rule.name) },
    { for rule in var.custom_rules : rule.name => rule }
  )
}

data "aws_backup_vault" "main" {
  count = var.create_backup_vault ? 0 : 1

  name = var.vault_name
}

resource "aws_backup_vault" "main" {
  count = var.create_backup_vault ? 1 : 0

  name          = var.vault_name
  force_destroy = var.vault_force_destroy
  kms_key_arn   = var.enable_customer_managed_kms ? module.kms[0].key_arn : var.kms_key_id

  tags = var.tags
}

resource "aws_backup_vault_lock_configuration" "main" {
  count = var.enable_vault_lock ? 1 : 0

  backup_vault_name   = var.vault_name
  changeable_for_days = var.changeable_for_days

  min_retention_days = var.min_retention_days
  max_retention_days = var.max_retention_days
}

resource "aws_backup_plan" "main" {
  name = var.plan_name

  dynamic "rule" {
    for_each = local.merged_rules

    content {
      target_vault_name = var.vault_name

      rule_name                = rule.value.name
      schedule                 = rule.value.schedule
      start_window             = rule.value.start_window
      completion_window        = rule.value.completion_window
      enable_continuous_backup = rule.value.enable_continuous_backup
      recovery_point_tags      = merge(var.tags, rule.value.recovery_point_tags)

      dynamic "lifecycle" {
        for_each = rule.value.lifecycle != null ? [rule.value.lifecycle] : []

        content {
          delete_after       = lifecycle.value.delete_after
          cold_storage_after = lifecycle.value.cold_storage_after
        }
      }

      dynamic "copy_action" {
        for_each = rule.value.copy_action != null ? [rule.value.copy_action] : []

        content {
          destination_vault_arn = copy_action.value.destination_vault_arn

          dynamic "lifecycle" {
            for_each = copy_action.value.lifecycle != null ? [copy_action.value.lifecycle] : []

            content {
              delete_after       = lifecycle.value.delete_after
              cold_storage_after = lifecycle.value.cold_storage_after
            }
          }
        }
      }
    }
  }

  dynamic "advanced_backup_setting" {
    for_each = var.enable_windows_vss_backup ? [true] : []

    content {
      resource_type = "EC2"
      backup_options = {
        WindowsVSS = "enabled"
      }
    }
  }

  depends_on = [aws_backup_vault.main]

  tags = var.tags
}

resource "aws_backup_selection" "main" {
  for_each = { for sel in var.selections : sel.name => sel }

  name    = "${var.vault_name}-${each.key}"
  plan_id = aws_backup_plan.main.id

  iam_role_arn = coalesce(each.value.role_arn, module.iam_role[0].arn)
  resources    = each.value.arns

  dynamic "selection_tag" {
    for_each = each.value.tag != null ? [each.value.tag] : []

    content {
      key   = selection_tag.value.key
      type  = selection_tag.value.type
      value = selection_tag.value.value
    }
  }
}

module "iam_role" {
  count = var.role_arn == null ? 1 : 0

  source  = "geekcell/iam-role/aws"
  version = ">= 1.0.0, < 2.0.0"

  name = "${var.vault_name}-backup"

  description  = "This role is responsible for restoring/backing up the resources in the Vault."
  assume_roles = { "Service" : { identifiers = ["backup.amazonaws.com"] } }
  policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup",
    "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForRestores",
    "arn:aws:iam::aws:policy/AWSBackupServiceRolePolicyForS3Backup",
    "arn:aws:iam::aws:policy/AWSBackupServiceRolePolicyForS3Restore"
  ]

  tags = var.tags
}

module "kms" {
  count = var.enable_customer_managed_kms ? 1 : 0

  source  = "geekcell/kms/aws"
  version = ">= 1.0.0, < 2.0.0"

  alias = "/backup/vault/${var.vault_name}"
  tags  = var.tags
}
