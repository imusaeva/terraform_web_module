resource "aws_autoscaling_policy" "scale_out" {
  name                   = replace(local.name, "rtype", "out")
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.main.name
}

resource "aws_cloudwatch_metric_alarm" "cloudwatch_alarm_out" {
  alarm_name          = replace(local.name, "rtype", "out")
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = 70
  tags                = merge(local.common_tags, { Name = replace(local.name, "rtype", "out-main") })
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.main.name
  }

  alarm_description = "This metric monitors average EC2 instance CPU utilization"
  alarm_actions     = [aws_autoscaling_policy.scale_out.arn]
}

resource "aws_autoscaling_policy" "scale_in" {
  name                   = replace(local.name, "rtype", "in")
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.main.name
}

resource "aws_cloudwatch_metric_alarm" "cloudwatch_scale_in" {
  alarm_name          = replace(local.name, "rtype", "in")
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = 10
  tags                = merge(local.common_tags, { Name = replace(local.name, "rtype", "in-main") })
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.main.name
  }

  alarm_description = "This metric monitors average EC2 instance CPU utilization"
  alarm_actions     = [aws_autoscaling_policy.scale_in.arn]
}