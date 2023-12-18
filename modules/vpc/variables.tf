variable "resource_name" {
  default = "steven-vpc"
}

variable "logical_name" {
  default = ""
}

variable "ngw_subnet_id" {
  default = ""
}

variable "ig_id" {
  default = ""
}

variable "cidr_block" {
  default = ""
}

variable "public_subnets_ids" {
  default = []
}

variable "private_subnets_ids" {
  default = []
}


variable "igw_route_table_id" {
  default = ""
}