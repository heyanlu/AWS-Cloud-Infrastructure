variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  default = {
    "subnet1" = { cidr = "10.0.1.0/24", az = "us-east-1a" }
    "subnet2" = { cidr = "10.0.2.0/24", az = "us-east-1b" }
    "subnet3" = { cidr = "10.0.3.0/24", az = "us-east-1c" }
  }
}

variable "private_subnets" {
  default = {
    "subnet4" = { cidr = "10.0.4.0/24", az = "us-east-1a" }
    "subnet5" = { cidr = "10.0.5.0/24", az = "us-east-1b" }
  }
}