resource "azurerm_resource_group" "resume_postgres_rg" {
  name     = "resume-postgres-rg"
  location = "East US"
}

resource "azurerm_resource_group" "resume_keyvault_rg" {
  name     = "resume-keyvautl-rg"
  location = "East US"
}