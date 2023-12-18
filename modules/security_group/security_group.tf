#public instance/bastion host
resource "aws_security_group" "bastion_sg" {
  name        = "${var.resource_name}-bastion"
  description = "sg for bastion server"
  vpc_id      = var.vpc_id

  ingress {
    description = "allow ssh on local machine with company vpn"
    from_port   = var.port_ssh # ssh
    to_port     = var.port_ssh # ssh
    protocol    = var.protocol_tcp
    cidr_blocks = ["114.108.241.26/32"]
  }

  ingress {
    description = "allow ssh on local machine without company vpn"
    from_port   = var.port_ssh # ssh
    to_port     = var.port_ssh # ssh
    protocol    = var.protocol_tcp
    cidr_blocks = ["112.210.234.130/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.placeholder_address]
  }

  tags = {
    Name = "${var.resource_name}-bastion"
  }
}

#private instance
resource "aws_security_group" "web_sg" {
  name        = "${var.resource_name}-web"
  description = "sg for web server"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = var.port_ssh # ssh
    to_port         = var.port_ssh # ssh
    protocol        = var.protocol_tcp
    security_groups = [aws_security_group.bastion_sg.id]
  }

  ingress {
    description     = "enable ping"
    from_port       = -1
    to_port         = -1
    protocol        = "icmp"
    security_groups = [aws_security_group.bastion_sg.id]
  }

  ingress {
    description     = "comms between load balancer and instances"
    from_port       = var.port_http
    to_port         = var.port_http
    protocol        = var.protocol_tcp
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.placeholder_address]
  }

  tags = {
    Name = "${var.resource_name}-web"
  }
}

resource "aws_security_group" "alb_sg" {
  name        = "${var.resource_name}-alb"
  description = "sg for alb"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow all inbound traffic on the load balancer listener port"
    from_port   = var.port_http
    to_port     = var.port_http
    protocol    = var.protocol_tcp
    cidr_blocks = ["0.0.0.0/0"]
  }

  #   ingress {
  #   description = "Allow all inbound traffic on the load balancer listener port"
  #   from_port       = 443 # ssh
  #   to_port         = 443 # ssh
  #   protocol        = var.protocol_tcp
  #   cidr_blocks = [ "0.0.0.0/0" ]
  # }

  egress {
    description = "Allow outbound traffic to instances on the instance listener port"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    # security_groups = [aws_security_group.web_sg.id]
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.resource_name}-web"
  }
}