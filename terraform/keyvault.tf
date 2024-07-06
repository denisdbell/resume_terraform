
resource "azurerm_key_vault" "resume_key_vault" {
  name                        = "key_vault_resume"
  location                    = azurerm_resource_group.resume_keyvault_rg.location
  resource_group_name         = azurerm_resource_group.resume_keyvault_rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

data "azurerm_key_vault_secret" "secret_resume_db_username" {
  name         = "secret-resume-db-username"
  key_vault_id = azurerm_key_vault.resume_key_vault.id
}

data "azurerm_key_vault_secret" "secret_resume_db_password" {
  name         = "secret-resume-db-password"
  key_vault_id = azurerm_key_vault.resume_key_vault.id
}