resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type

  min_tls_version                  = "TLS1_2"
  allow_nested_items_to_be_public  = false
  shared_access_key_enabled        = true

  blob_properties {
    versioning_enabled = var.enable_versioning
  }

  tags = var.tags
}
