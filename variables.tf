variable "region" {
  default = "ap-south-1"
}
variable "vpc_cidr" {
  default = "190.160.0.0/16"
  # default = "10.0.0.0/16"
}
variable "subnet_cidr" {
  type    = list(any)
  default = ["190.160.1.0/24", "190.160.2.0/24", "190.160.3.0/24"]
  # default = "10.0.1.0/24"
}
# variable "key_name" {
#   description = " SSH keys to connect to ec2 instance"
#   default     = "Jenkins"
# }
# variable "my_ami" {
#   default = "ami-0002bdad91f793433"
# }

# variable "instance_type" {
#   description = "instance type for aws ec2"
#   default     = "t2.micro"

# }
# variable "azs" {
#   type    = list(any)
#   default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
# }
# Declare the data source
data "aws_availability_zones" "azs" {
  state = "available"
}

