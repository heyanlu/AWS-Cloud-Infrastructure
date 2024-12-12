variable "aws_access_key_id" {
  description = "AWS Access Key ID"
  type        = string
  sensitive   = true
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
  type        = string
  sensitive   = true
}

# variable "aws_session_token" {
#   description = " AWS Session Token"
#   type        = string
#   sensitive   = true
# }

variable "aws_region" {
  description = "The AWS region for resources"
  type        = string
  default     = "us-east-1"
}