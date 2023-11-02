output "backup_vault_id" {
  description = "The ID of the backup vault."
  value       = aws_backup_vault.main.id
}

output "backup_vault_arn" {
  description = "The ARN of the backup vault."
  value       = aws_backup_vault.main.arn
}

output "backup_plan_id" {
  description = "The ID of the backup plan."
  value       = aws_backup_plan.main.id
}

output "backup_plan_arn" {
  description = "The ARN of the backup plan."
  value       = aws_backup_plan.main.arn
}
