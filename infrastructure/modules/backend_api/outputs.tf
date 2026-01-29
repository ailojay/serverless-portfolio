output "api_endpoint" {
  description = "API Gateway endpoint URL"
  value       = aws_apigatewayv2_api.main.api_endpoint
}

output "projects_lambda_arn" {
  description = "Projects Lambda function ARN"
  value       = aws_lambda_function.projects.arn
}

output "projects_table_name" {
  description = "DynamoDB projects table name"
  value       = aws_dynamodb_table.projects.name
}

output "projects_table_arn" {
  description = "DynamoDB projects table ARN"
  value       = aws_dynamodb_table.projects.arn
}