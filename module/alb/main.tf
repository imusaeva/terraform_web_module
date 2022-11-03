resource "aws_lb_target_group" "main" {
  name     = replace(local.name, "rtype", "tg")
  port     = var.app_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path = "/"
    port = var.app_port
  }
  tags = merge(local.common_tags, { Name = replace(local.name, "rtype", "alb_tg") })
}

resource "aws_lb" "alb_v2" {
  name               = replace(local.name, "rtype", "alb-v2")
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.subnets_id
  tags = merge(local.common_tags, { Name = replace(local.name, "rtype", "alb_v2") })
}

resource "aws_lb_listener" "alb_v2" {
  load_balancer_arn = aws_lb.alb_v2.arn
  port              = var.app_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}