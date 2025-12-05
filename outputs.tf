output "s3_bucket_name" {
  description = "Name of the created S3 bucket"
  value       = aws_s3_bucket.app_bucket.bucket
}

output "s3_bucket_arn" {
  description = "ARN of the created S3 bucket"
  value       = aws_s3_bucket.app_bucket.arn
}

output "s3_bucket_region" {
  description = "Region where the S3 bucket was created"
  value       = aws_s3_bucket.app_bucket.region
}

output "s3_bucket_domain_name" {
  description = "Domain name of the S3 bucket"
  value       = aws_s3_bucket.app_bucket.bucket_domain_name
}

output "s3_bucket_hosted_zone_id" {
  description = "Hosted zone ID for the S3 bucket"
  value       = aws_s3_bucket.app_bucket.hosted_zone_id
}

output "project_info" {
  description = "Project information"
  value = {
    project_name = var.project_name
    environment  = var.environment
    owner        = var.owner_email
    region       = var.aws_region
  }
}