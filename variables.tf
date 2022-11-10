## Naming
variable "vault_name" {
  description = "Name of the backup vault to create."
  type        = string
}

variable "backup_name" {
  description = "The display name of a backup plan."
  type        = string
}

variable "tags" {
  description = "Tags to add to the AWS Backup."
  default     = {}
  type        = map(any)
}

## Backup
variable "rules" {
  description = "Backup rules to add to the AWS Backup Vault. See examples for usage."
  default     = []
  type = list(object({
    name                     = string
    schedule                 = string
    start_window             = number
    completion_window        = number
    enable_continuous_backup = bool
    lifecycle                = map(string)
  }))
}
