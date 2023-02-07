module "basic-example" {
  source = "../../"

  vault_name  = "main"
  backup_name = "rds"
  service     = "s3"
  resources   = ["arn:aws:s3:::my-bucket"]
}
