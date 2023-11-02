<!-- BEGIN_TF_DOCS -->
[![Geek Cell GmbH](https://raw.githubusercontent.com/geekcell/.github/main/geekcell-github-banner.png)](https://www.geekcell.io/)

### Code Quality
[![License](https://img.shields.io/github/license/geekcell/terraform-aws-backup)](https://github.com/geekcell/terraform-aws-backup/blob/master/LICENSE)
[![GitHub release (latest tag)](https://img.shields.io/github/v/release/geekcell/terraform-aws-backup?logo=github&sort=semver)](https://github.com/geekcell/terraform-aws-backup/releases)
[![Release](https://github.com/geekcell/terraform-aws-backup/actions/workflows/release.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-backup/actions/workflows/release.yaml)
[![Validate](https://github.com/geekcell/terraform-aws-backup/actions/workflows/validate.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-backup/actions/workflows/validate.yaml)
[![Lint](https://github.com/geekcell/terraform-aws-backup/actions/workflows/linter.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-backup/actions/workflows/linter.yaml)
[![Test](https://github.com/geekcell/terraform-aws-backup/actions/workflows/test.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-backup/actions/workflows/test.yaml)

### Security
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-backup/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-backup&benchmark=INFRASTRUCTURE+SECURITY)

#### Cloud
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-backup/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-backup&benchmark=CIS+AWS+V1.2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-backup/cis_aws_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-backup&benchmark=CIS+AWS+V1.3)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-backup/cis_azure)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-backup&benchmark=CIS+AZURE+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-backup/cis_azure_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-backup&benchmark=CIS+AZURE+V1.3)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-backup/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-backup&benchmark=CIS+GCP+V1.1)

##### Container
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-backup/cis_kubernetes_16)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-backup&benchmark=CIS+KUBERNETES+V1.6)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-backup/cis_eks_11)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-backup&benchmark=CIS+EKS+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-backup/cis_gke_11)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-backup&benchmark=CIS+GKE+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-backup/cis_kubernetes)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-backup&benchmark=CIS+KUBERNETES+V1.5)

#### Data protection
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-backup/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-backup&benchmark=SOC2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-backup/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-backup&benchmark=PCI-DSS+V3.2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-backup/pci_dss_v321)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-backup&benchmark=PCI-DSS+V3.2.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-backup/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-backup&benchmark=ISO27001)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-backup/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-backup&benchmark=NIST-800-53)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-backup/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-backup&benchmark=HIPAA)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-backup/fedramp_moderate)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-backup&benchmark=FEDRAMP+%28MODERATE%29)

# Terraform AWS Backup

This Terraform module provides a preconfigured solution for setting up
AWS Backup in your AWS account. With this module, you can easily and
efficiently create and manage backups for your AWS resources. Our
team has extensive experience working with AWS Backup and has optimized
this module to provide the best possible experience for users.

Using this Terraform module, you can save time and effort in setting up
and managing your backup policies, as well as avoid common mistakes and
pitfalls. The module encapsulates all necessary configurations, making
it easy to use and integrate into your existing AWS environment. Whether
you are looking to add backup protection for your critical resources or
streamline your existing backup processes, this Terraform module is a
great choice.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_changeable_for_days"></a> [changeable\_for\_days](#input\_changeable\_for\_days) | The number of days before the lock date. If omitted creates a vault lock in governance mode, otherwise it will create<br>  a vault lock in compliance mode. When you apply this setting:<br><br>  The vault will become immutable in 3 days after applying. You have 3 days of grace time to manage or delete the vault<br>  lock before it becomes immutable. During this time, only those users with specific IAM permissions can make changes.<br><br>  Once the vault is locked in compliance mode, it cannot be managed or deleted by anyone, even the root user or AWS.<br>  The only way to deactivate the lock is to terminate the account, which will delete all the backups.<br><br>  Since you cannot delete the Vault, it will be charged for backups until that date. Be careful! | `number` | `null` | no |
| <a name="input_custom_rules"></a> [custom\_rules](#input\_custom\_rules) | Backup rules to add to the AWS Backup Vault. See examples for usage. | <pre>list(object({<br>    name     = string<br>    schedule = optional(string)<br><br>    start_window      = optional(number)<br>    completion_window = optional(number)<br><br>    enable_continuous_backup = optional(bool)<br>    recovery_point_tags      = optional(map(string), {})<br><br>    lifecycle = optional(object({<br>      cold_storage_after = optional(number)<br>      delete_after       = optional(number)<br>    }))<br><br>    copy_action = optional(object({<br>      destination_vault_arn = optional(string)<br>      lifecycle = optional(object({<br>        cold_storage_after = optional(number)<br>        delete_after       = optional(number)<br>      }))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_enable_customer_managed_kms"></a> [enable\_customer\_managed\_kms](#input\_enable\_customer\_managed\_kms) | Whether to enable customer managed KMS encryption for the backup vault. | `bool` | `false` | no |
| <a name="input_enable_vault_lock"></a> [enable\_vault\_lock](#input\_enable\_vault\_lock) | Whether to enable Vault Lock for the backup vault. | `bool` | `false` | no |
| <a name="input_enable_windows_vss_backup"></a> [enable\_windows\_vss\_backup](#input\_enable\_windows\_vss\_backup) | Whether to enable Windows VSS backup for the backup plan. | `bool` | `false` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN of the KMS Key to use to encrypt your backups. If left empty, the default AWS KMS will be used. | `string` | `null` | no |
| <a name="input_max_retention_days"></a> [max\_retention\_days](#input\_max\_retention\_days) | The maximum retention period that the vault retains its recovery points. | `number` | `365` | no |
| <a name="input_min_retention_days"></a> [min\_retention\_days](#input\_min\_retention\_days) | The minimum retention period that the vault retains its recovery points. | `number` | `7` | no |
| <a name="input_plan_name"></a> [plan\_name](#input\_plan\_name) | The display name of the backup plan. | `string` | n/a | yes |
| <a name="input_predefined_rules"></a> [predefined\_rules](#input\_predefined\_rules) | A list of predefined backup rules to add to the AWS Backup Plan. See examples for usage. | `list(string)` | `[]` | no |
| <a name="input_resources"></a> [resources](#input\_resources) | An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to assign to a backup plan. | `list(string)` | `[]` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | The ARN of the IAM role that AWS Backup uses to authenticate when restoring or backing up the target resources. If left empty, a default role will be created. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to the AWS Backup. | `map(any)` | `{}` | no |
| <a name="input_vault_force_destroy"></a> [vault\_force\_destroy](#input\_vault\_force\_destroy) | Whether to allow the backup vault to be destroyed even if it contains recovery points. | `string` | `false` | no |
| <a name="input_vault_name"></a> [vault\_name](#input\_vault\_name) | Name of the backup vault to create. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backup_plan_arn"></a> [backup\_plan\_arn](#output\_backup\_plan\_arn) | The ARN of the backup plan. |
| <a name="output_backup_plan_id"></a> [backup\_plan\_id](#output\_backup\_plan\_id) | The ID of the backup plan. |
| <a name="output_backup_vault_arn"></a> [backup\_vault\_arn](#output\_backup\_vault\_arn) | The ARN of the backup vault. |
| <a name="output_backup_vault_id"></a> [backup\_vault\_id](#output\_backup\_vault\_id) | The ID of the backup vault. |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.36 |

## Resources

- resource.aws_backup_plan.main (main.tf#45)
- resource.aws_backup_selection.main (main.tf#103)
- resource.aws_backup_vault.main (main.tf#27)
- resource.aws_backup_vault_lock_configuration.main (main.tf#35)

# Examples
### Basic Example
```hcl
module "basic-example" {
  source = "../../"

  vault_name = "main"
  plan_name  = "s3"
  resources  = ["arn:aws:s3:::my-bucket"]
}
```

### With Rules
```hcl
module "with-rules" {
  source = "../../"

  vault_name = "main"
  plan_name  = "s3"
  resources  = ["arn:aws:s3:::my-bucket"]

  predefined_rules = ["daily-snapshot", "monthly-snapshot"]
  custom_rules = [
    {
      name                     = "my-custom-rule"
      schedule                 = "cron(0 3 ? * 2,3,4,5,6,7,1 *)"
      start_window             = 60
      completion_window        = 240
      enable_continuous_backup = false

      lifecycle = {
        cold_storage_after = 1
        delete_after       = 180 # half a year
      }
    }
  ]
}
```

# Predefined Rules
```hcl
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
```
<!-- END_TF_DOCS -->
