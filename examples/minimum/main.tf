module "example" {
  source = "../../"

  vault_name  = "main"
  backup_name = "rds"
  service     = "s3"
}
