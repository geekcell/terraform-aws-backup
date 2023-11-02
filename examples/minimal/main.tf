module "basic-example" {
  source = "../../"

  vault_name = "main"
  plan_name  = "s3"
  resources  = ["arn:aws:s3:::my-bucket"]
}
