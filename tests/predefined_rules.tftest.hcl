run "create_vault_with_predefined_rules" {
  variables {
    vault_name = "example-vault"
    plan_name  = "example-plan"

    # Not possible on the Testing Account
    enable_vault_lock         = false
    enable_windows_vss_backup = true

    predefined_rules = ["daily-snapshot", "monthly-snapshot", "yearly-snapshot"]

    tags = {
      Environment = "Dev"
      Foo         = "Bar"
    }
  }

  assert {
    condition     = length(output.backup_vault_id) >= 1
    error_message = "Expected Backup Vault to be created."
  }

  assert {
    condition     = length(aws_backup_vault.main.kms_key_arn) >= 1
    error_message = "Expected Backup Plan to be encrypted by default AWS KMS key."
  }

  assert {
    condition     = length(output.backup_plan_id) >= 1
    error_message = "Expected Backup Plan to be created."
  }

  assert {
    condition     = length(aws_backup_plan.main.rule) == 3
    error_message = "Expected Backup Plan to have 3 rules."
  }

  assert {
    condition     = one(aws_backup_plan.main.advanced_backup_setting).backup_options.WindowsVSS == "enabled"
    error_message = "Expected Backup Plan to have WindowsVSS enabled."
  }

  assert {
    condition     = length(aws_backup_vault_lock_configuration.main) == 0
    error_message = "Expected Vault to be not locked."
  }

  assert {
    condition     = length(aws_backup_vault.main.tags) == 2
    error_message = "Expected Vault to have 2 tags."
  }

  assert {
    condition     = length(aws_backup_plan.main.tags) == 2
    error_message = "Expected Vault to have 2 tags."
  }
}
