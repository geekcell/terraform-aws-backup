run "create_vault_with_custom_rules" {
  variables {
    vault_name = "example-vault"
    plan_name  = "example-plan"

    custom_rules = [
      {
        name     = "backup-rule-1"
        schedule = "cron(0 8 ? * * *)"
      },
      {
        name     = "backup-rule-2"
        schedule = "cron(0 12 1 1 ? *)"

        lifecycle = {
          delete_after = 3650 # 10 years
        }
      }
    ]

    selections = [
      {
        name = "s3-buckets"
        arns = ["arn:aws:s3:::my-bucket", "arn:aws:s3:::my-other-bucket"]
      },
      {
        name = "db-snaps"
        arns = ["arn:aws:rds:eu-central-1:*:db:my-mysql-instance"]
      }
    ]

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
    condition     = length(aws_backup_plan.main.rule) == 2
    error_message = "Expected Backup Plan to have 2 rules."
  }

  assert {
    condition     = length(aws_backup_selection.main["s3-buckets"].resources) == 2
    error_message = "Expected S3 backup selection to contain 2 resources."
  }

  assert {
    condition     = length(aws_backup_selection.main["db-snaps"].resources) == 1
    error_message = "Expected DB backup selection to contain 1 resources."
  }

  assert {
    condition     = length(module.iam_role) == 1
    error_message = "Expected default IAM role to be created."
  }

  assert {
    condition     = aws_backup_selection.main["s3-buckets"].iam_role_arn == module.iam_role[0].arn
    error_message = "Expected backup selection IAM role to be the default one."
  }
}
