# variable "alb_sg" {
#   default = []
# }

# variable "alb_subnets" {
#   default = []
# }

# variable "vpc_id" {
#   default = ""
# }

# variable "instance_ids" {
#   default = []
# }

# variable "alb_target_group_arn" {
#   default = []
# }

# variable "asg_id" {
#   default = ""
# }

# variable "target_ids" {
#   default = []
# }

variable "alb_sg" {
  default = []
}

variable "alb_subnets" {
  default = []
}

variable "s3_bucket_name" {
  default = ""
}

variable "vpc_id" {
  default = ""
}

variable "target_ids" {
  default = []
}