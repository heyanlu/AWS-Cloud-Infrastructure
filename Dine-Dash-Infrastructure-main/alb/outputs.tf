output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = aws_lb.webapp_alb.dns_name
}

output "target_group_arn" {
  description = "ARN of the ALB target group"
  value       = aws_lb_target_group.webapp_target_group.arn
}