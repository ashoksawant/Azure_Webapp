# Azure Web App for Python and SQL Database using Terraform and Azure DevOps

This project demonstrates how to deploy an Azure Web App for a Python application with a SQL Database using Terraform and Azure DevOps.

## Prerequisites

- Azure Account
- Terraform installed
- Azure CLI installed
- Azure DevOps Account
- Python installed

## Architecture

1. **Azure Web App**: Hosts the Python application.
2. **Azure SQL Database**: Stores the application's data.
3. **Terraform**: Manages the infrastructure as code.
4. **Azure DevOps**: Automates the deployment process.

## Setup Instructions

### 1. Clone the Repository

```bash
git clone <repository-url>
cd <repository-directory>

## Create backend.tf File
- Do not push this file to public repositories. Manually add it in your environment.

- Create a backend.tf file to configure the backend for storing the Terraform state:
```
terraform {
  backend "azurerm" {
    resource_group_name   = "<your-resource-group-name>"
    storage_account_name  = "<your-storage-account-name>"
    container_name        = "<your-container-name>"
    key                   = "terraform.tfstate"
  }
}
### Replace <your-resource-group-name>, <your-storage-account-name>, and <your-container-name> with your actual Azure resource group name, storage account name, and container name.

## Create terraform.tfvars File
- Do not push this file to public repositories. Manually add it in your environment.

- Create a terraform.tfvars file to provide values for the variables:
```
resource_group_name   = "your-resource-group-name"
location              = "your-location"
app_service_plan_name = "your-app-service-plan-name"
app_name              = "your-app-name"
db_name               = "your-db-name"
db_username           = "your-db-username"
db_password           = "your-db-password"
environment           = "your-environment"

### Replace the placeholder values with your actual values.

## Initialize and validate, plan,  Apply Terraform
```
terraform init
terraform validate
terraform fmt
terraform plan
terraform apply

## Configure Azure DevOps Pipeline
- Create a new pipeline in Azure DevOps.
- Use the provided azure-pipelines.yml file to define the pipeline.
