resource "aws_autoscaling_group" "app_asg" {
  name = "webapp-asg"
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  vpc_zone_identifier = var.vpc_subnet_ids

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  health_check_type         = "ELB"
  health_check_grace_period = 300
  target_group_arns         = [var.target_group_arn]

  tag {
    key                 = "Name"
    value               = "webapp-instance"
    propagate_at_launch = true
  }
}

# resource "aws_cloudwatch_metric_alarm" "scale_up_alarm" {
#   alarm_name                = "scale-up-cpu-utilization"
#   comparison_operator       = "GreaterThanThreshold"
#   evaluation_periods        = 1
#   metric_name               = "CPUUtilization"
#   namespace                 = "AWS/EC2"
#   period                    = 60
#   statistic                 = "Average"
#   threshold                 = 70
#   alarm_description         = "Scale up when CPU utilization exceeds 70%"
#   dimensions = {
#     AutoScalingGroupName = aws_autoscaling_group.app_asg.name
#   }

#   alarm_actions = [
#     aws_autoscaling_policy.scale_up_policy.arn
#   ]
# }

# resource "aws_cloudwatch_metric_alarm" "scale_down_alarm" {
#   alarm_name                = "scale-down-cpu-utilization"
#   comparison_operator       = "LessThanThreshold"
#   evaluation_periods        = 1
#   metric_name               = "CPUUtilization"
#   namespace                 = "AWS/EC2"
#   period                    = 60
#   statistic                 = "Average"
#   threshold                 = 30
#   alarm_description         = "Scale down when CPU utilization drops below 30%"
#   dimensions = {
#     AutoScalingGroupName = aws_autoscaling_group.app_asg.name
#   }

#   alarm_actions = [
#     aws_autoscaling_policy.scale_down_policy.arn
#   ]
# }

# resource "aws_autoscaling_policy" "scale_up_policy" {
#   name                   = "scale-up-policy"
#   scaling_adjustment     = 1
#   adjustment_type        = "ChangeInCapacity"
#   cooldown               = 300
#   autoscaling_group_name = aws_autoscaling_group.app_asg.name
# }

# resource "aws_autoscaling_policy" "scale_down_policy" {
#   name                   = "scale-down-policy"
#   scaling_adjustment     = -1
#   adjustment_type        = "ChangeInCapacity"
#   cooldown               = 300
#   autoscaling_group_name = aws_autoscaling_group.app_asg.name
# }