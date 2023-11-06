output "backup_vault_id" {
  description = "The ID of the backup vault."
  value       = var.create_backup_vault ? aws_backup_vault.main[0].id : data.aws_backup_vault.main[0].id
}

output "backup_vault_arn" {
  description = "The ARN of the backup vault."
  value       = var.create_backup_vault ? aws_backup_vault.main[0].arn : data.aws_backup_vault.main[0].arn
}

output "backup_plan_id" {
  description = "The ID of the backup plan."
  value       = aws_backup_plan.main.id
}

output "backup_plan_arn" {
  description = "The ARN of the backup plan."
  value       = aws_backup_plan.main.arn
}
