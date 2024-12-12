variable "vpc_id" {
  description = "ID of the VPC where the ALB will be deployed"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for the ALB"
  type        = string
}

variable "certificate_arn" {
  description = "Certificate for dine-dash"
  default = "arn:aws:acm:us-east-1:211125640329:certificate/7c3c7ea7-d682-46a7-9daa-2cd9dc633b5c"
  type = string
}
