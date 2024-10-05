variable "ec2-ami" {
  default = "ami-0e86e20dae9224db8"
  type = string
}

variable "ec2-instance-type" {
  default = "t2.micro"
  type = string
}

variable "ec2-name" {
  default = "final-depi-project"
  type = string
}


variable "ec2-subnet-id" {
  default = null
  type = string
}

variable "vpc-id" {
  default = null
  type = string
}