# Context
variable "tags" {
  description = "Tags to add to the AWS Backup."
  default     = {}
  type        = map(any)
}

# AWS Backup
variable "backup_name" {
  description = "The display name of a backup plan."
  type        = string
}

variable "changeable_for_days" {
  description = " The number of days before the lock date. If omitted creates a vault lock in governance mode, otherwise it will create a vault lock in compliance mode."
  default     = null
  type        = number
}

variable "min_retention_days" {
  description = "The minimum retention period that the vault retains its recovery points."
  default     = 7
  type        = number
}

variable "max_retention_days" {
  description = "The maximum retention period that the vault retains its recovery points."
  default     = 365
  type        = number
}

variable "resources" {
  description = "An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to assign to a backup plan."
  default     = []
  type        = list(string)
}

variable "rules" {
  description = "Backup rules to add to the AWS Backup Vault. See examples for usage."
  default     = [
    # Weekly At 03:00 AM UTC, only on
    # Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, and Sunday
    {
      name                     = "weekly-snapshot"
      schedule                 = "cron(0 3 ? * 2,3,4,5,6,7,1 *)"
      start_window             = 60
      completion_window        = 240
      enable_continuous_backup = false
      lifecycle                = {
        cold_storage_after = 1
        delete_after       = 365 # 1 year
      }
    },
    # Monthly At 03:00 AM UTC, on day 1 of the month
    {
      name                     = "monthly-snapshot"
      schedule                 = "cron(0 3 1 * ? *)"
      start_window             = 60
      completion_window        = 240
      enable_continuous_backup = false
      lifecycle                = {
        cold_storage_after = 1
        delete_after       = 365 # 1 year
      }
    },
    # At 03:00 AM UTC, on day 1 of the month, only in
    # January, April, July, and October
    {
      name                     = "quarterly-snapshot"
      schedule                 = "cron(0 3 1 1,4,7,10 ? *)"
      start_window             = 60
      completion_window        = 240
      enable_continuous_backup = false
      lifecycle                = {
        cold_storage_after = 1
        delete_after       = 730 # 2 years
      }
    },
    # At 03:00 AM UTC, on day 1 of the month, only in January
    {
      name                     = "yearly-snapshot"
      schedule                 = "cron(0 3 1 1 ? *)"
      start_window             = 60
      completion_window        = 240
      enable_continuous_backup = false
      lifecycle                = {
        cold_storage_after = 1
        delete_after       = 3650 # 10 years
      }
    },
    # Daily
    {
      name                     = "daily-snapshot"
      schedule                 = "cron(0 3 ? * * *)"
      start_window             = 60
      completion_window        = 240
      enable_continuous_backup = true
      lifecycle                = {
        cold_storage_after = null
        delete_after       = 35
      }
    }
  ]
  type = list(object({
    name                     = string
    schedule                 = string
    start_window             = number
    completion_window        = number
    enable_continuous_backup = bool
    lifecycle                = map(string)
  }))
}

variable "service" {
  description = "The service that the resource belongs to."
  type        = string
}

variable "vault_name" {
  description = "Name of the backup vault to create."
  type        = string
}
