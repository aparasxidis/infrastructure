# AWS S3 Bucket Infrastructure

This Terraform configuration creates an AWS S3 bucket with security best practices and optional features.

## Features

- ✅ **Secure S3 Bucket**: Public access blocked by default
- ✅ **Server-side Encryption**: AES256 encryption enabled
- ✅ **Versioning Support**: Optional bucket versioning
- ✅ **Lifecycle Management**: Automatic cleanup of old versions
- ✅ **Resource Tagging**: Consistent tagging strategy
- ✅ **Random Suffix**: Ensures globally unique bucket names

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform >= 1.0 installed
- AWS provider permissions for S3 resource creation

## Quick Start

1. **Clone and Configure**
   ```bash
   git clone <repository-url>
   cd infrastructure
   cp terraform.tfvars.example terraform.tfvars
   ```

2. **Edit Configuration**
   ```bash
   # Edit terraform.tfvars with your values
   project_name = "your-project-name"
   environment  = "dev"
   owner_email  = "your-email@domain.com"
   aws_region   = "us-east-1"
   ```

3. **Deploy Infrastructure**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

4. **Cleanup (when needed)**
   ```bash
   terraform destroy
   ```

## Configuration Options

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `aws_region` | AWS region for resources | `us-east-1` | No |
| `project_name` | Project name (used in naming) | - | **Yes** |
| `environment` | Environment (dev/staging/prod) | `dev` | No |
| `owner_email` | Project owner email | - | **Yes** |
| `enable_versioning` | Enable S3 versioning | `true` | No |
| `enable_lifecycle` | Enable lifecycle management | `true` | No |
| `lifecycle_days` | Days before old versions expire | `30` | No |

## Outputs

After successful deployment, you'll receive:

- **S3 Bucket Name**: The actual bucket name with random suffix
- **S3 Bucket ARN**: Amazon Resource Name for the bucket
- **S3 Bucket Region**: Region where bucket was created
- **Project Information**: Summary of configuration used

## Security Features

- **Public Access Blocked**: All public access is blocked by default
- **Encryption at Rest**: AES256 server-side encryption
- **Resource Tagging**: Consistent tags for cost tracking and management
- **Lifecycle Policies**: Automatic cleanup to reduce storage costs

## AWS User Group Ensenada

This infrastructure template is part of the AWS User Group Ensenada learning materials, demonstrating Infrastructure as Code best practices with Terraform and AWS.

For questions or support, contact: **AWS User Group Ensenada**