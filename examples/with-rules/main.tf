module "with-rules" {
  source = "../../"

  vault_name  = "main"
  backup_name = "rds"
  service     = "s3"

  rules = [
    {
      name                     = "weekly-snapshot"
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
