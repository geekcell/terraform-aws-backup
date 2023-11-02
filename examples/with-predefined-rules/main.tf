module "with-rules" {
  source = "../../"

  vault_name = "my-project"
  plan_name  = "customer-data"

  predefined_rules = ["daily-snapshot", "monthly-snapshot"]
  custom_rules = [
    {
      name                     = "my-custom-rule"
      schedule                 = "cron(0 3 ? * 2,3,4,5,6,7,1 *)"
      start_window             = 60
      completion_window        = 240
      enable_continuous_backup = false

      lifecycle = {
        cold_storage_after = 1
        delete_after       = 180 # half a year
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
      arns = ["arn:aws:rds:us-east-2:123456789012:db:my-mysql-instance"]
    }
  ]
}
