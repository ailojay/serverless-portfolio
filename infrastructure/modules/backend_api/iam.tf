# Lambda execution role
resource "aws_iam_role" "lambda_execution_role" {
  name = "${var.project_name}-lambda-execution-role-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# Basic Lambda execution policy
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.lambda_execution_role.name
}

# DynamoDB read-only policy
resource "aws_iam_policy" "dynamodb_read_policy" {
  name        = "${var.project_name}-dynamodb-read-policy-${var.environment}"
  description = "Read-only access to DynamoDB projects table"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:GetItem",
          "dynamodb:Query"
        ]
        "Resource": "arn:aws:dynamodb:us-east-1:912874556898:table/serverless-portfolio-projects-dev"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_dynamodb_read" {
  policy_arn = aws_iam_policy.dynamodb_read_policy.arn
  role       = aws_iam_role.lambda_execution_role.name
}