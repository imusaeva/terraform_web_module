output "alb_id" {
  value = aws_lb.alb_v2.id
}

output "target_group_arn" {
  value = aws_lb_target_group.main.arn
}