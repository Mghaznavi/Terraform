# variable

variable  "region" {
  default = "ap-southeast-2"
}

variable  "vpc_cidr" {
  default = "172.16.0.0/16"
}

variable  "vpc_tags" {
  default = "Alexdigital_vpc"
}

variable  "vpc_Name" {
  default = "Alexdigital_vpc"
}
##############################################
# variable  "subnet_vpc"  {
#  default =
#}

variable "subnet_cidr"  {
  default = "172.16.10.0/24"
}

variable "subnet_availability"  {
    default = "ap-southeast-2b"
}

variable "subnet_tag" {
  default = "Alexdigital_subnet"
}
##############################################
variable "network_private_ips"  {
  default = "172.16.10.100"
}

variable "network_tag" {
  default = "Alexdigital_network"
}

##############################################

variable "aws_ami"  {
  default = "ami-09b42976632b27e9b"
}

variable  "aws_instance_type" {
  default = "t2.micro"
}

variable  "aws_tags" {
  default = "Alex_digital"
}
##############################################

variable  "security_tag"  {
  default = "my_security"
}
