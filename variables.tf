# Context
variable "tags" {
  description = "Tags to add to the AWS Backup."
  default     = {}
  type        = map(any)
}

# Backup Vault
variable "vault_name" {
  description = "Name of the backup vault to create."
  type        = string
}

variable "vault_force_destroy" {
  description = "Whether to allow the backup vault to be destroyed even if it contains recovery points."
  default     = false
  type        = string
}

# Vault Lock
variable "enable_vault_lock" {
  description = "Whether to enable Vault Lock for the backup vault."
  default     = false
  type        = bool
}

variable "changeable_for_days" {
  description = <<EOF
  The number of days before the lock date. If omitted creates a vault lock in governance mode, otherwise it will create
  a vault lock in compliance mode. When you apply this setting:

  The vault will become immutable in 3 days after applying. You have 3 days of grace time to manage or delete the vault
  lock before it becomes immutable. During this time, only those users with specific IAM permissions can make changes.

  Once the vault is locked in compliance mode, it cannot be managed or deleted by anyone, even the root user or AWS.
  The only way to deactivate the lock is to terminate the account, which will delete all the backups.

  Since you cannot delete the Vault, it will be charged for backups until that date. Be careful!
EOF
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

# AWS Backup
variable "plan_name" {
  description = "The display name of the backup plan."
  type        = string
}

variable "predefined_rules" {
  description = "A list of predefined backup rules to add to the AWS Backup Plan. See examples for usage."
  default     = []
  type        = list(string)

  validation {
    condition = alltrue([
      for rule in var.predefined_rules :
      true
      if contains([
        "daily-snapshot",
        "weekly-snapshot",
        "monthly-snapshot",
        "quarterly-snapshot",
        "yearly-snapshot",
      ], rule)
    ])
    error_message = "Invalid predefined_rules. Valid rules are 'daily-snapshot', 'weekly-snapshot', 'monthly-snapshot', 'quarterly-snapshot', 'yearly-snapshot'."
  }
}

variable "custom_rules" {
  description = "Backup rules to add to the AWS Backup Vault. See examples for usage."
  default     = []
  type = list(object({
    name     = string
    schedule = optional(string)

    start_window      = optional(number)
    completion_window = optional(number)

    enable_continuous_backup = optional(bool)
    recovery_point_tags      = optional(map(string), {})

    lifecycle = optional(object({
      cold_storage_after = optional(number)
      delete_after       = optional(number)
    }))

    copy_action = optional(object({
      destination_vault_arn = optional(string)
      lifecycle = optional(object({
        cold_storage_after = optional(number)
        delete_after       = optional(number)
      }))
    }))
  }))
}

variable "enable_windows_vss_backup" {
  description = "Whether to enable Windows VSS backup for the backup plan."
  default     = false
  type        = bool
}

# Backup Selection
variable "selections" {
  description = "An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to assign to a backup plan."
  default     = []
  type = list(object({
    name     = string
    role_arn = optional(string)

    arns = optional(list(string))
    tag = optional(object({
      type  = string
      key   = string
      value = string
    }))
  }))
}

variable "role_arn" {
  description = "The ARN of the IAM role that AWS Backup uses to authenticate when restoring or backing up the target resources. If left empty, a default role will be created."
  default     = null
  type        = string
}

# KMS Encryption
variable "kms_key_id" {
  description = "The ARN of the KMS Key to use to encrypt your backups. If left empty, the default AWS KMS will be used."
  default     = null
  type        = string
}

variable "enable_customer_managed_kms" {
  description = "Whether to enable customer managed KMS encryption for the backup vault."
  default     = false
  type        = bool
}
