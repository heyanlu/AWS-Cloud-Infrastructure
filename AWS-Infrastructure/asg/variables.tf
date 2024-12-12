variable "desired_capacity" {
  type        = number
  description = "The desired number of instances in the ASG."
  default     = 1
}

variable "max_size" {
  type        = number
  description = "The maximum number of instances in the ASG."
  default     = 3
}

variable "min_size" {
  type        = number
  description = "The minimum number of instances in the ASG."
  default     = 1
}

variable "vpc_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for the ASG."
}

variable "launch_template_id" {
  type        = string
  description = "The ID of the Launch Template to associate with the ASG."
}

variable "target_group_arn" {
  type        = string
  description = "The ARN of the Target Group for the ASG."
}
