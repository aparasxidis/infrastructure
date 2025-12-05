variable "s3name" {
  description = "Unique name of the S3 bucket component"
  type        = string
  
  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.s3name))
    error_message = "S3 name must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "acl" {
  description = "Access control level for the S3 bucket"
  type        = string
  default     = "private"
  
  validation {
    condition     = contains(["private", "public-read", "public-read-write"], var.acl)
    error_message = "ACL must be one of: private, public-read, public-read-write."
  }
}