resource "aws_instance" "jump_host" {
  ami                    = "ami-02453f5468b897e31"
  instance_type          = "t2.micro"
  key_name               = "steven-tf-keypair"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = "steven-jump-host"
  }

  depends_on = [var.dependency]
}

data "aws_instances" "all_instances" {
  instance_tags = {
    Owner = "steven-asg"
  }
}