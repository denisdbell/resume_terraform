resource "azurerm_resource_group" "resume_postgres_rg" {
  name     = "resume-postgres-rg"
  location = "East US"
}

resource "azurerm_postgresql_server" "resume_postgres" {
  name                = "resume-postgresql-server"
  location            = azurerm_resource_group.resume_postgres_rg.location
  resource_group_name = azurerm_resource_group.resume_postgres_rg.name

  sku_name = "B_Gen5_2"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = "psqladmin"
  administrator_login_password = "H@Sh1CoR3!"
  version                      = "9.5"
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "resume_visitor_count" {
  name                = "resume_visitor_count"
  resource_group_name = azurerm_resource_group.resume_postgres_rg.name
  server_name         = azurerm_postgresql_server.resume_postgres.name
  charset             = "UTF8"
  collation           = "English_United States.1252"

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}