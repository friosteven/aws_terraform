variable "region" {
  default = "ap-southeast-1"
}
variable "availability_zones" {
  default = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "user" {
  default = "steven"
}

variable "s3_name" {
  default = "steven-s3-state-bucket"
}

variable "s3_tf_key" {
  default = "terraform.tfstate"
}

variable "dynamo_table_name" {
  default = "steven-dynamo-table"
}

variable "az1" {
  type    = string
  default = "ap-southeast-1a"
}

variable "az2" {
  type    = string
  default = "ap-southeast-1b"
}

######## SUBNETS
variable "default_address" {
  default = "10.0.0.0/16"
}

variable "placeholder_address" {
  default = "0.0.0.0/0"
}

variable "access_type" {
  default = ["public", "private"]
}

variable "resource_name" {
  default = ""
}