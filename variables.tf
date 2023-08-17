variable "VPC" {
  default = "week4_VPC"
}

variable "VPC_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_a_cidr_block" {
  default = "10.0.0.0/24"
}

variable "public_b_cidr_block" {
  default = "10.0.1.0/24"
}

variable "SG" {
  default = "week4_SG"
}

variable "region" {
  default = "us-west-2"
}

variable "ami" {
  default = "ami-03f65b8614a860c29"
}

variable "instance_type" {
  default = "t2.micro"
}

