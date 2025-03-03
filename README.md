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

1. **Clone the Repository**

   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Create `backend.tf` File**

   > **Important**: Do not push this file to public repositories. Manually add it in your environment.

   ### Create a `backend.tf` file to configure the backend for storing the Terraform state:

   ```hcl
   terraform {
     backend "azurerm" {
       resource_group_name   = "<your-resource-group-name>"
       storage_account_name  = "<your-storage-account-name>"
       container_name        = "<your-container-name>"
       key                   = "terraform.tfstate"
     }
   }
   ```

   > **Note**: Replace `<your-resource-group-name>`, `<your-storage-account-name>`, and `<your-container-name>` with your actual Azure resource group name, storage account name, and container name.

3. **Create `terraform.tfvars` File**

   > **Important**: Do not push this file to public repositories. Manually add it in your environment.

   ### Create a `terraform.tfvars` file to provide values for the variables:

   ```hcl
   resource_group_name   = "your-resource-group-name"
   location              = "your-location"
   app_service_plan_name = "your-app-service-plan-name"
   app_name              = "your-app-name"
   db_name               = "your-db-name"
   db_username           = "your-db-username"
   db_password           = "your-db-password"
   environment           = "your-environment"
   ```

   > **Note**: Replace the placeholder values with your actual values.

4. **Initialize and Validate Terraform**

   Run the following commands to initialize, validate, format, plan, and apply the Terraform configuration:

   ```bash
   terraform init
   terraform validate
   terraform fmt
   terraform plan
   terraform apply
   ```

5. **Configure Azure DevOps Pipeline**

   - Create a new pipeline in Azure DevOps.
   - Use the provided `azure-pipelines.yml` file to define the pipeline.

## Additional Notes

- Ensure that your Terraform state and variable files are secure and not exposed in public repositories.
- This setup assumes you're using Azure DevOps for CI/CD. Modify the pipeline file as necessary for other CI/CD tools.
```

### Changes made:
- All instructions and code have been combined into one section for a cleaner and more concise presentation.
