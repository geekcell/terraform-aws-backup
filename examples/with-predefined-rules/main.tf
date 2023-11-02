module "with-rules" {
  source = "../../"

  vault_name = "main"
  plan_name  = "s3"
  resources  = ["arn:aws:s3:::my-bucket"]

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
}
