# auto scaling group launch teemplate for web app in the private subnet
resource "aws_launch_template" "launch_template" {
  name = var.resource_name

  # disable_api_stop        = true
  # disable_api_termination = true

  image_id = var.ami-id

  instance_initiated_shutdown_behavior = "terminate"

  instance_type = var.instance_type

  key_name               = "steven-tf-keypair"
  vpc_security_group_ids = var.vpc_security_group_ids

  monitoring {
    enabled = true
  }

  user_data = filebase64("${path.module}/user_data.tpl")

  tags = {
    Name = var.resource_name
  }
}
