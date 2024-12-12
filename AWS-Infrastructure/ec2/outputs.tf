output "launch_template_id" {
  description = "The ID of the webapp launch template"
  value       = aws_launch_template.webapp.id
}

output "launch_template_arn" {
  description = "The ARN of the webapp launch template"
  value       = aws_launch_template.webapp.arn
}
