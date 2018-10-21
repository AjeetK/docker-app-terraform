variable "aws_region" {
  description = "Region for the VPC"
  default = "ap-southeast-1"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "10.0.1.0/24"
}


variable "ami" {
  description = "Ubuntu 16.04"
  default = "ami-0eb1f21bbd66347fe"
}

variable "instance_type" {
  description = "Type of instance to be launched"
  default = "t2.micro"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "public_key"
}
