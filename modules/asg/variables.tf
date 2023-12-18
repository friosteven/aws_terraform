variable "resource_name" {
  default = "steven-asg"
}

variable "launch_template_id" {
  default = ""
}

variable "availability_zones" {
  default = []
}

# variable "lb_target_group_arn" {
#   default =  ""
# }

variable "lb_target_group_arn" {
  default = ""
}

variable "autoscaling_group_names" {
  default = ""
}

variable "subnet_ids" {
  default = []
}

variable "alb_id" {
  default = ""
}