# Health Lambda
resource "aws_lambda_function" "health" {
  filename         = "${path.module}/../../../backend/lambda/health/lambda.zip"
  function_name    = "${var.project_name}-health-${var.environment}"
  role            = aws_iam_role.lambda_execution_role.arn
  handler         = "app.lambda_handler"
  source_code_hash = filebase64sha256("${path.module}/../../../backend/lambda/health/lambda.zip")
  runtime         = var.lambda_runtime
  timeout         = var.lambda_timeout
}

# Projects Lambda
resource "aws_lambda_function" "projects" {
  filename         = "${path.module}/../../../backend/lambda/projects/lambda.zip"
  function_name    = "${var.project_name}-projects-${var.environment}"
  role            = aws_iam_role.lambda_execution_role.arn
  handler         = "app.lambda_handler"
  source_code_hash = filebase64sha256("${path.module}/../../../backend/lambda/projects/lambda.zip")
  runtime         = var.lambda_runtime
  timeout         = var.lambda_timeout
  
  environment {
    variables = {
      PROJECTS_TABLE_NAME = aws_dynamodb_table.projects.name
    }
  }
}