data "azurerm_resource_group" "example" {
  name = var.resource_group_name
}

locals {
  env_name = var.environment
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = "${var.app_service_plan_name}-${local.env_name}"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  os_type             = "Linux"
  sku_name            = "B1"
}


resource "azurerm_app_service" "web_app" {
  name                = "${var.app_name}-${local.env_name}"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  app_service_plan_id = azurerm_service_plan.app_service_plan.id

  app_settings = {
    # ODBC Connection String for Azure SQL Database
    "ODBC_CONNECTION_STRING" = "Driver={ODBC Driver 18 for SQL Server};Server=tcp:${azurerm_mssql_server.db_server.fully_qualified_domain_name},1433;Database=${var.db_name};Uid=${var.db_username};Pwd=${var.db_password};Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;"

    # Enable SCM build during deployment
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = "true"
    "DB_HOST"                        = azurerm_mssql_server.db_server.fully_qualified_domain_name
    "DB_USERNAME"                    = var.db_username
    "DB_PASSWORD"                    = var.db_password
    "DB_NAME"                        = var.db_name
  }

  site_config {
    linux_fx_version = "PYTHON|3.11"
  }
}

resource "azurerm_mssql_server" "db_server" {
  name                         = "sqlserver${random_id.server_id.hex}-${local.env_name}"
  resource_group_name          = data.azurerm_resource_group.example.name
  location                     = data.azurerm_resource_group.example.location
  administrator_login          = var.db_username
  administrator_login_password = var.db_password
  version                      = "12.0"
}

resource "azurerm_mssql_database" "db" {
  name      = "${var.db_name}-${local.env_name}"
  server_id = azurerm_mssql_server.db_server.id
  sku_name  = "Basic"
}

resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.db_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "random_id" "server_id" {
  byte_length = 5
}