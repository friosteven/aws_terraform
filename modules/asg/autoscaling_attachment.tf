resource "aws_autoscaling_attachment" "asg_attachment" {
  lb_target_group_arn    = var.lb_target_group_arn
  autoscaling_group_name = aws_autoscaling_group.asg.id
  # elb = var.alb_id
}