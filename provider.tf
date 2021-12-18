provider "aws" {
  region = var.region
}

# resource "aws_instance" "myDemoInstance" {
#   ami             = var.my_ami
#   key_name        = var.key_name
#   instance_type   = var.instance_type
#   security_groups = ["security_jenkins_port"]
#   tags = {
#     Name = "jenkins_instance"
#   }
# }

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    name     = "main"
    location = "Delhi NCR"
  }
}
resource "aws_subnet" "subnet1" {
  count             = length(data.aws_availability_zones.azs.names)
  availability_zone = element(data.aws_availability_zones.azs.names, count.index)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.subnet_cidr, count.index)
  #  cidr_block = var.subnet_cidr
  tags = {
    name = "subnet-${count.index + 1}"
  }
}
