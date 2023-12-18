# resource "aws_lb_target_group" "alb_target_group" {
#   name     = "steven-alb-target-group"
#   protocol = "HTTP"
#   port     = 80
#   vpc_id   = var.vpc_id

#   health_check {
#     protocol = "HTTP"
#     port     = 80
#     path     = "/health"
#   }
# }