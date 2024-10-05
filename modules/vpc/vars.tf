variable "vpc_cidr" {
  default = "10.0.0.0/16"
  type = string
}

variable "vpc_name" {
  default = "vpc-final-project-2"
  type = string
}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
  type = string
}


variable "subnet_avb" {
  default = "us-east-1a"
  type = string
}

variable "subnet_name" {
  default = "subnet-final-project-2"
  type = string
}

variable "route_name" {
  default = "route-final-project-2"
  type = string
}


variable "gw_name" {
  default = "gw-final-project-2"
  type = string
}