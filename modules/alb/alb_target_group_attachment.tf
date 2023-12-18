# resource "aws_lb_target_group_attachment" "alb_target_group_attachment" {
#   count            = length(var.target_ids)
#   target_group_arn = var.alb_target_group_arn
#   target_id        = var.target_ids[count.index]
# }