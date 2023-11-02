locals {
  predefined_rules = [
    # At 03:00 AM UTC, daily
    {
      name                     = "daily-snapshot"
      schedule                 = "cron(0 3 ? * * *)"
      start_window             = 60
      completion_window        = 240
      enable_continuous_backup = true
      recovery_point_tags      = {}

      lifecycle = {
        cold_storage_after = null
        delete_after       = 35 # 5 weeks
      }

      copy_action = null
    },

    # At 03:00 AM UTC, every Sunday
    {
      name                     = "weekly-snapshot"
      schedule                 = "cron(0 3 ? * SUN *)"
      start_window             = 60
      completion_window        = 240
      enable_continuous_backup = true
      recovery_point_tags      = {}

      lifecycle = {
        cold_storage_after = null
        delete_after       = 183 # 6 months
      }

      copy_action = null
    },

    # At 03:00 AM UTC, on day 1 of the month
    {
      name                     = "monthly-snapshot"
      schedule                 = "cron(0 3 1 * ? *)"
      start_window             = 60
      completion_window        = 240
      enable_continuous_backup = false
      recovery_point_tags      = {}

      lifecycle = {
        cold_storage_after = 1   # day
        delete_after       = 365 # 1 year
      }

      copy_action = null
    },

    # At 03:00 AM UTC, on day 1 of the month, only in January, April, July, and October
    {
      name                     = "quarterly-snapshot"
      schedule                 = "cron(0 3 1 1,4,7,10 ? *)"
      start_window             = 60
      completion_window        = 240
      enable_continuous_backup = false
      recovery_point_tags      = {}

      lifecycle = {
        cold_storage_after = 1   # day
        delete_after       = 730 # 2 years
      }

      copy_action = null
    },

    # At 03:00 AM UTC, on day 1 of the month, only in January
    {
      name                     = "yearly-snapshot"
      schedule                 = "cron(0 3 1 1 ? *)"
      start_window             = 60
      completion_window        = 240
      enable_continuous_backup = false
      recovery_point_tags      = {}

      lifecycle = {
        cold_storage_after = 1    # day
        delete_after       = 3650 # 10 years
      }

      copy_action = null
    }
  ]
}
