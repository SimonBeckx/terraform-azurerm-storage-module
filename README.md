# Terraform Azure Storage Module

A reusable Terraform module for creating Azure Storage Accounts with sensible security defaults.

## Features

- TLS 1.2 enforced
- Public blob access disabled by default
- Optional blob versioning
- Configurable replication type (LRS, GRS, ZRS, etc.)

## Usage

```hcl
module "storage" {
  source = "git::https://github.com/YOUR_GITHUB_USER/terraform-azurerm-storage-module.git?ref=v1.0.0"

  storage_account_name = "myappdevdata"
  resource_group_name  = "rg-myapp-dev"
  location             = "westeurope"
  replication_type     = "GRS"
  enable_versioning    = true

  tags = {
    Environment = "production"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `storage_account_name` | Storage account name (3-24 lowercase alphanumeric) | `string` | — | yes |
| `resource_group_name` | Resource group to deploy into | `string` | — | yes |
| `location` | Azure region | `string` | — | yes |
| `account_tier` | Storage tier (`Standard` or `Premium`) | `string` | `"Standard"` | no |
| `replication_type` | Replication type (`LRS`, `GRS`, `ZRS`, …) | `string` | `"LRS"` | no |
| `enable_versioning` | Whether to enable blob versioning | `bool` | `false` | no |
| `tags` | Tags to apply to the storage account | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| `storage_account_id` | The ID of the storage account |
| `storage_account_name` | The name of the storage account |
| `primary_blob_endpoint` | The primary blob service endpoint |
| `primary_connection_string` | The primary connection string (sensitive) |

## Changelog

### v1.1.0
- Add `primary_blob_endpoint` and `primary_connection_string` outputs

### v1.0.0
- Initial release
