module "basic-example" {
  source = "../../"

  vault_name = "my-project"
  plan_name  = "customer-data"

  selections = [
    {
      name = "s3-buckets"
      arns = ["arn:aws:s3:::my-bucket", "arn:aws:s3:::my-other-bucket"]
    },
    {
      name = "db-snaps"
      arns = ["arn:aws:rds:us-east-2:123456789012:db:my-mysql-instance"]
    }
  ]
}
