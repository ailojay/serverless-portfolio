terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "backend_api" {
  source = "../../modules/backend_api"
  
  environment = var.environment
  project_name = var.project_name
}

module "frontend" {
  source = "../../modules/frontend"
  
  environment = var.environment
  project_name = var.project_name
}