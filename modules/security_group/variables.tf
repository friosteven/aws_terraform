variable "resource_name" {
  default = "steven-sg"
}

variable "vpc_id" {
  default = ""
}

variable "placeholder_address" {
  default = "0.0.0.0/0"
}

variable "port_ssh" {
  default = 22
}

variable "port_http" {
  default = 80
}

variable "protocol_tcp" {
  default = "tcp"
}