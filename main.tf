terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  
  default_tags {
    tags = {
      Project       = var.s3name
      ManagedBy     = "Terraform"
      CreatedBy     = "Backstage-Template"
    }
  }
}

# S3 Bucket for application storage
resource "aws_s3_bucket" "app_bucket" {
  bucket = "${var.s3name}-${random_id.bucket_suffix.hex}"
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# S3 Bucket ACL
resource "aws_s3_bucket_acl" "app_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.app_bucket_acl_ownership]
  bucket = aws_s3_bucket.app_bucket.id
  acl    = var.acl
}

resource "aws_s3_bucket_ownership_controls" "app_bucket_acl_ownership" {
  bucket = aws_s3_bucket.app_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# S3 Bucket Public Access Block (only if ACL is private)
resource "aws_s3_bucket_public_access_block" "app_bucket_pab" {
  count  = var.acl == "private" ? 1 : 0
  bucket = aws_s3_bucket.app_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# S3 Bucket Server Side Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "app_bucket_encryption" {
  bucket = aws_s3_bucket.app_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    bucket_key_enabled = true
  }
}