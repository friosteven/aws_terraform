resource "aws_lb" "alb" {
  name               = "steven-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.alb_sg
  subnets            = var.alb_subnets
}

resource "aws_lb_listener" "alb_listener_http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

resource "aws_lb_target_group" "alb_target_group" {
  name     = "steven-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    protocol = "HTTP"
    path     = "/"
    port     = 80
  }
}

resource "aws_lb_target_group_attachment" "alb_target_group_attachment" {
  count            = length(var.target_ids)
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = var.target_ids[count.index]
  port             = 80
}