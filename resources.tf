provider "aws" {
  region = "${var.region}"
}

# vpc

resource "aws_vpc" "my_vpc" {
  cidr_block           = "${var.vpc_cidr}"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags {
    Name = "{var.vpc_Name}"
  }
}

# subnet

resource "aws_subnet" "my_subnet" {
  vpc_id            = "${aws_vpc.my_vpc.id}"
  cidr_block        = "${var.subnet_cidr}"
  availability_zone = "${var.subnet_availability}"

  tags {
    Name = "${var.subnet_tag}"
  }
}

# network

resource "aws_network_interface" "web" {
  subnet_id = "${aws_subnet.my_subnet.id}"

  #private_ips = "172.16.10.100"

  tags {
    Name = "${var.network_tag}"
  }
}

resource "aws_instance" "web" {
  ami           = "${var.aws_ami}"           #ap-southeast-2
  instance_type = "${var.aws_instance_type}"

  network_interface {
    network_interface_id = "${aws_network_interface.web.id}"
    device_index         = 0
  }

  tags {
    Name = "${var.aws_tags_name}"
    Days  = "${var.aws_tags_days}"
    Email =   "${var.aws_tags_email}"
    Environmant = "${var.aws_tags_environment}"
    Hostnames=  "${var.aws_tags_hostname}"
    IC-Customer = "${var.aws_tags_customer}"
    Override  = "${var.aws_tags_override}"
    Sked  = "${var.aws_tags_sked}"
    Time  = "${var.aws_tags_time}"
    Timezone  = "${var.aws_tags_timezone}"
    Chargeable  = "${var.aws_tags_chargeable}"
    org-name  = "${var.aws_tags_orgname}"
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}

# security

resource "aws_security_group_rule" "allow_all" {
  type            = "ingress"
  from_port       = 0
  to_port         = 65535
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]
  prefix_list_ids = ["pl-12c4e678"]

  tags {
    Name = "${var.security_tag}"
  }

  security_group_id = ""
}
