<!-- BEGIN_TF_DOCS -->
[![Geek Cell GmbH](https://raw.githubusercontent.com/geekcell/.github/main/geekcell-github-banner.png)](https://www.geekcell.io/)

### Code Quality
[![License](https://img.shields.io/github/license/geekcell/terraform-aws-backup)](https://github.com/geekcell/terraform-aws-backup/blob/master/LICENSE)
[![GitHub release (latest tag)](https://img.shields.io/github/v/release/geekcell/terraform-aws-backup?logo=github&sort=semver)](https://github.com/geekcell/terraform-aws-backup/releases)
[![Release](https://github.com/geekcell/terraform-aws-backup/actions/workflows/release.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-backup/actions/workflows/release.yaml)
[![Validate](https://github.com/geekcell/terraform-aws-backup/actions/workflows/validate.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-backup/actions/workflows/validate.yaml)
[![Lint](https://github.com/geekcell/terraform-aws-backup/actions/workflows/linter.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-backup/actions/workflows/linter.yaml)

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
efficiently create and manage backup policies for your AWS resources. Our
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
| <a name="input_backup_name"></a> [backup\_name](#input\_backup\_name) | The display name of a backup plan. | `string` | n/a | yes |
| <a name="input_changeable_for_days"></a> [changeable\_for\_days](#input\_changeable\_for\_days) | The number of days before the lock date. If omitted creates a vault lock in governance mode, otherwise it will create a vault lock in compliance mode. | `number` | `null` | no |
| <a name="input_max_retention_days"></a> [max\_retention\_days](#input\_max\_retention\_days) | The maximum retention period that the vault retains its recovery points. | `number` | `365` | no |
| <a name="input_min_retention_days"></a> [min\_retention\_days](#input\_min\_retention\_days) | The minimum retention period that the vault retains its recovery points. | `number` | `7` | no |
| <a name="input_resources"></a> [resources](#input\_resources) | An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to assign to a backup plan. | `list(string)` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | Backup rules to add to the AWS Backup Vault. See examples for usage. | <pre>list(object({<br>    name                     = string<br>    schedule                 = string<br>    start_window             = number<br>    completion_window        = number<br>    enable_continuous_backup = bool<br>    lifecycle                = map(string)<br>  }))</pre> | <pre>[<br>  {<br>    "completion_window": 240,<br>    "enable_continuous_backup": false,<br>    "lifecycle": {<br>      "cold_storage_after": 1,<br>      "delete_after": 365<br>    },<br>    "name": "weekly-snapshot",<br>    "schedule": "cron(0 3 ? * 2,3,4,5,6,7,1 *)",<br>    "start_window": 60<br>  },<br>  {<br>    "completion_window": 240,<br>    "enable_continuous_backup": false,<br>    "lifecycle": {<br>      "cold_storage_after": 1,<br>      "delete_after": 365<br>    },<br>    "name": "monthly-snapshot",<br>    "schedule": "cron(0 3 1 * ? *)",<br>    "start_window": 60<br>  },<br>  {<br>    "completion_window": 240,<br>    "enable_continuous_backup": false,<br>    "lifecycle": {<br>      "cold_storage_after": 1,<br>      "delete_after": 730<br>    },<br>    "name": "quarterly-snapshot",<br>    "schedule": "cron(0 3 1 1,4,7,10 ? *)",<br>    "start_window": 60<br>  },<br>  {<br>    "completion_window": 240,<br>    "enable_continuous_backup": false,<br>    "lifecycle": {<br>      "cold_storage_after": 1,<br>      "delete_after": 3650<br>    },<br>    "name": "yearly-snapshot",<br>    "schedule": "cron(0 3 1 1 ? *)",<br>    "start_window": 60<br>  },<br>  {<br>    "completion_window": 240,<br>    "enable_continuous_backup": true,<br>    "lifecycle": {<br>      "cold_storage_after": null,<br>      "delete_after": 35<br>    },<br>    "name": "daily-snapshot",<br>    "schedule": "cron(0 3 ? * * *)",<br>    "start_window": 60<br>  }<br>]</pre> | no |
| <a name="input_service"></a> [service](#input\_service) | The service that the resource belongs to. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to the AWS Backup. | `map(any)` | `{}` | no |
| <a name="input_vault_name"></a> [vault\_name](#input\_vault\_name) | Name of the backup vault to create. | `string` | n/a | yes |

## Outputs

No outputs.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.36 |

## Resources

- resource.aws_backup_plan.main (main.tf#55)
- resource.aws_backup_selection.main (main.tf#48)
- resource.aws_backup_vault.main (main.tf#18)
- resource.aws_backup_vault_lock_configuration.main (main.tf#25)
- resource.aws_iam_role.main (main.tf#96)
- resource.aws_iam_role_policy_attachment.main_backup (main.tf#103)
- resource.aws_iam_role_policy_attachment.main_restore (main.tf#108)
- resource.aws_iam_role_policy_attachment.s3_backup (main.tf#113)
- resource.aws_iam_role_policy_attachment.s3_restore (main.tf#118)
- data source.aws_iam_policy_document.main (data.tf#1)

# Examples
### Basic Example
```hcl
module "basic-example" {
  source = "../../"

  vault_name  = "main"
  backup_name = "rds"
  service     = "s3"
  resources   = ["arn:aws:s3:::my-bucket"]
}
```

### With Rules
```hcl
module "with-rules" {
  source = "../../"

  vault_name  = "main"
  backup_name = "rds"
  service     = "s3"
  resources   = ["arn:aws:s3:::my-bucket"]

  rules = [
    {
      name                     = "weekly-snapshot"
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
<!-- END_TF_DOCS -->
