variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "serverless-portfolio"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}