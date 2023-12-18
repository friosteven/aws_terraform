variable "resource_name" {
  default = "steven-launch-template"
}

variable "vpc_security_group_ids" {
  default = []
}

variable "ami-id" {
  default = "ami-02453f5468b897e31"
}

variable "instance_type" {
  default = "t2.micro"
}