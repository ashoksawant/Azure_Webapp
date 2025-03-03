output "web_app_url" {
  description = "The URL of the web app"
  value       = azurerm_app_service.web_app.default_site_hostname
}

output "db_name" {
  description = "The name of the SQL Database"
  value       = azurerm_mssql_database.db.name
}

output "web_app_name" {
  description = "The name of the web app"
  value       = azurerm_app_service.web_app.name
}