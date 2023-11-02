run "create_vault_with_custom_rules" {
  variables {
    vault_name = "example-vault"
    plan_name  = "example-plan"

    predefined_rules = ["daily-snapshot", "yearly-snapshot"]
    custom_rules = [
      # Daily Snapshot but change the schedule to run at 12:00 UTC
      {
        name     = "daily-snapshot"
        schedule = "cron(0 12 ? * * *)"
      },

      # Yearly Snapshot but delete after 3 years instead
      {
        name = "yearly-snapshot"
        lifecycle = {
          delete_after = 1095
        }
      }
    ]
  }

  assert {
    condition     = length(output.backup_vault_id) >= 1
    error_message = "Expected Backup Vault to be created."
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
    condition     = one([for rule in aws_backup_plan.main.rule : rule if rule.rule_name == "daily-snapshot"]).schedule == "cron(0 12 ? * * *)"
    error_message = "Expected daily-snapshot rule to have new schedule."
  }

  assert {
    condition     = one(one([for rule in aws_backup_plan.main.rule : rule if rule.rule_name == "yearly-snapshot"]).lifecycle).delete_after == 1095
    error_message = "Expected yearly-snapshot rule to have new lifecycle."
  }
}
