variable "environment" {
  description = "Environment name"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "cors_max_age" {
  description = "CORS max age in seconds"
  type        = number
  default     = 300
}

variable "lambda_runtime" {
  description = "Lambda runtime version"
  type        = string
  default     = "python3.12"
}

variable "lambda_timeout" {
  description = "Lambda timeout in seconds"
  type        = number
  default     = 30
}

variable "sample_project_id" {
  description = "Sample project ID"
  type        = string
  default     = "PROJECT#001"
}

variable "sample_project_title" {
  description = "Sample project title"
  type        = string
  default     = "Serverless Portfolio Platform"
}

variable "sample_project_description" {
  description = "Sample project description"
  type        = string
  default     = "Production-grade AWS serverless portfolio built with Terraform"
}

variable "sample_project_github" {
  description = "Sample project GitHub URL"
  type        = string
  default     = "https://github.com/ailojay/serverless-portfolio"
}

variable "aws_region" {
  description = "AWS region for constructing URLs"
  type        = string
  default     = "us-east-1"
}