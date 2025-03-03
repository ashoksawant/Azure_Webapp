variable "environment" {
  type = string

}
variable "subscription_id" {
  type = string
}
variable "client_id" {
  type = string
}
variable "tenant_id" {
  type = string
}
variable "client_secret" {
  type      = string
  sensitive = true
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location/region where the resources will be created"
  type        = string
  default     = "East US"
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan"
  type        = string
  default     = "webappplan"
}

variable "app_name" {
  description = "The name of the App Service"
  type        = string
  default     = "Webapplinuxpython"
}

variable "db_name" {
  description = "The name of the SQL Database"
  type        = string
  default     = "Indiainfra"
}

variable "db_username" {
  description = "The administrator username for the SQL Server"
  type        = string
}

variable "db_password" {
  description = "The administrator password for the SQL Server"
  type        = string
  sensitive   = true
}