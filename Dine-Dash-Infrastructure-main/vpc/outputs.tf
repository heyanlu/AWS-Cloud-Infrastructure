output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.webapp_vpc.id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs in the VPC"
  value       = [for subnet in aws_subnet.public_subnets : subnet.id]
}

output "private_subnet_ids" {
  description = "List of private subnet IDs in the VPC"
  value = [for subnet in aws_subnet.private_subnets : subnet.id]
}

