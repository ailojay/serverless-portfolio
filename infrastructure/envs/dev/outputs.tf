output "backend_api_url" {
  value = module.backend_api.api_endpoint
}

output "frontend_url" {
  value = module.frontend.website_endpoint
}

output "backend_lambda_arn" {
  value = module.backend_api.projects_lambda_arn
}

output "projects_table_name" {
  value = module.backend_api.projects_table_name
}

output "projects_table_arn" {
  value = module.backend_api.projects_table_arn
}