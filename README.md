# Serverless Portfolio Platform

A production-grade AWS serverless portfolio platform built with Terraform.

## Architecture

- **Frontend**: Static website hosted on S3
- **Backend**: HTTP API Gateway with Lambda functions
- **Database**: DynamoDB for portfolio projects
- **Infrastructure**: Fully modular Terraform

## Project Structure

```
serverless-portfolio/
├── frontend/                 # Static website files
│   ├── index.html
│   ├── app.js
│   └── config.js
├── backend/                  # Lambda functions
│   └── lambda/
│       ├── health/
│       │   └── app.py
│       └── projects/
│           └── app.py
├── infrastructure/           # Terraform modules
│   ├── envs/dev/            # Environment-specific configs
│   └── modules/             # Reusable modules
│       ├── backend_api/
│       └── frontend/
├── docs/                    # Documentation
├── scripts/                 # Deployment scripts
├── tests/                   # Test files
└── README.md
```

## Deployment

1. Navigate to the dev environment:
   ```bash
   cd infrastructure/envs/dev
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Plan the deployment:
   ```bash
   terraform plan
   ```

4. Apply the infrastructure:
   ```bash
   terraform apply
   ```

5. Get the outputs:
   ```bash
   terraform output
   ```

## API Endpoints

- `GET /health` - Health check endpoint
- `GET /projects` - Retrieve portfolio projects

## Features

- ✅ Serverless architecture
- ✅ CORS enabled
- ✅ Read-only DynamoDB access
- ✅ Modular Terraform design
- ✅ Environment separation
- ✅ IAM least privilege
- ✅ Static website hosting

## Tech Stack

- AWS Lambda (Python 3.9)
- API Gateway HTTP API
- DynamoDB
- S3 Static Website
- Terraform
- Vanilla JavaScript# serverless-portfolio
