resource "aws_dynamodb_table" "projects" {
  name           = "${var.project_name}-projects-${var.environment}"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "pk"

  attribute {
    name = "pk"
    type = "S"
  }
lifecycle {
  prevent_destroy = true
}

  tags = {
    Name        = "${var.project_name}-projects-${var.environment}"
    Environment = var.environment
  }
}

# Insert sample project data
