variable "cidr_vpc"  {
 type = string 
 description = "define cidr range for vpc "
 default = "10.0.0.0/16"
 }

variable "enviroment_tags" {
  type = string 
  description = "tag name"
}

variable "cidr_subnet" {
  type = string 
}

variable "availability_zone" {
type = list (string)
description = "list of availability_zone "
}