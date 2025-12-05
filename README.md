# AWS S3 Bucket Infrastructure

This Terraform configuration creates an AWS S3 bucket with configurable access control following the blog pattern from AWS Español.

## Features

- ✅ **Configurable S3 Bucket**: Supports private and public access configurations
- ✅ **Server-side Encryption**: AES256 encryption enabled
- ✅ **Flexible ACL**: Choose between private, public-read, or public-read-write
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
   s3name = "my-bucket"
   acl    = "private"
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
| `s3name` | Unique name for S3 bucket | - | **Yes** |
| `acl` | Access control (private/public-read/public-read-write) | `private` | No |

## Outputs

After successful deployment, you'll receive:

- **S3 Bucket Name**: The actual bucket name with random suffix
- **S3 Bucket ARN**: Amazon Resource Name for the bucket
- **S3 Bucket Region**: Region where bucket was created (us-east-1)
- **S3 Bucket ACL**: Access control configuration applied

## Security Features

- **Smart Public Access**: Public access blocked only for private buckets
- **Encryption at Rest**: AES256 server-side encryption
- **Resource Tagging**: Consistent tags for cost tracking and management
- **Flexible Access Control**: Configure access level based on use case

## AWS User Group Ensenada

This infrastructure template is part of the AWS User Group Ensenada learning materials, demonstrating Infrastructure as Code best practices with Terraform and AWS.

**Blog Reference**: [Desplegando infraestructura en AWS desde Backstage](https://dev.to/aws-espanol/desplegando-infraestructura-en-aws-desde-backstage-1aml)

For questions or support, contact: **AWS User Group Ensenada**