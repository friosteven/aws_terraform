resource "aws_autoscaling_group" "asg" {
  name                = var.resource_name
  vpc_zone_identifier = var.subnet_ids
  desired_capacity    = 2
  max_size            = 5
  min_size            = 1

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  tag {
    key                 = "Project"
    value               = "cloudbootcamp"
    propagate_at_launch = true
  }

  tag {
    key                 = "ProjectCode"
    value               = "cross-skilling"
    propagate_at_launch = true
  }


  tag {
    key                 = "Owner"
    value               = "steven-asg"
    propagate_at_launch = true
  }
}
