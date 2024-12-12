variable "ami_id" {
  default = "ami-02b6025d956ef1e5f"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type = string
}

variable "instance_sg_id" {
  description = "Security group ID for the EC2 instance"
  type = string
}

variable "instance_role" {
  description = "IAM role that reads/writes secrets manager"
  default = "arn:aws:iam::211125640329:instance-profile/DineDashSecrets"
  type = string
}