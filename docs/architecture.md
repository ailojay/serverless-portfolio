# Architecture Documentation

## System Overview

The Serverless Portfolio Platform is built using AWS serverless services with Infrastructure as Code (Terraform).

## Architecture Diagram

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   Frontend      │    │   API Gateway    │    │   Lambda        │
│   (S3 Static)   │───▶│   (HTTP API)     │───▶│   Functions     │
│                 │    │                  │    │                 │
└─────────────────┘    └──────────────────┘    └─────────────────┘
                                                         │
                                                         ▼
                                               ┌─────────────────┐
                                               │   DynamoDB      │
                                               │   (Projects)    │
                                               └─────────────────┘
```

## Components

### Frontend (S3 Static Website)
- **Technology**: Vanilla JavaScript, HTML, CSS
- **Hosting**: S3 Static Website Hosting
- **Features**: 
  - Responsive design
  - Dynamic project loading
  - CORS-enabled API calls

### Backend API (API Gateway + Lambda)
- **Technology**: Python 3.12, AWS Lambda
- **Endpoints**:
  - `GET /health` - Health check
  - `GET /projects` - Retrieve portfolio projects
- **Features**:
  - Serverless architecture
  - Auto-scaling
  - Pay-per-request pricing

### Database (DynamoDB)
- **Type**: NoSQL Document Database
- **Schema**: Single table design with partition key `pk`
- **Features**:
  - Pay-per-request billing
  - Automatic scaling
  - High availability

### Infrastructure (Terraform)
- **Modules**: Reusable components for frontend and backend
- **Environments**: Separated dev/staging/prod configurations
- **Features**:
  - Infrastructure as Code
  - Version controlled
  - Reproducible deployments

## Security

- **IAM**: Least privilege access policies
- **CORS**: Configured for frontend domain
- **Encryption**: DynamoDB encryption at rest
- **Network**: Public API with proper access controls

## Deployment

The entire infrastructure is deployed using Terraform with a single command:

```bash
cd infrastructure/envs/dev
terraform apply
```

## Monitoring

- **CloudWatch**: Automatic logging for Lambda functions
- **API Gateway**: Built-in monitoring and metrics
- **DynamoDB**: Performance insights and metrics