#!/bin/bash

# Serverless Portfolio Deployment Script

set -e

echo "🚀 Starting deployment of Serverless Portfolio Platform..."

# Navigate to dev environment
cd infrastructure/envs/dev

# Initialize Terraform (if needed)
if [ ! -d ".terraform" ]; then
    echo "📦 Initializing Terraform..."
    terraform init
fi

# Plan deployment
echo "📋 Planning deployment..."
terraform plan

# Ask for confirmation
read -p "🤔 Do you want to proceed with deployment? (y/N): " confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    echo "🔨 Deploying infrastructure..."
    terraform apply -auto-approve
    
    echo "✅ Deployment completed successfully!"
    echo "🌐 Getting outputs..."
    terraform output
else
    echo "❌ Deployment cancelled."
fi