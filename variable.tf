variable "my_AZ" {
  description = "this are my availablity zones" 
  type = list(string)
  default = [ "ap-south-1a", "ap-south-1b", "ap-south-1c" ]
    
}

variable "region" {
  description = "my aws region"
  type = string
  default = "ap-south-1"
}

variable "my_ami" {
    description = "aws ami"
    type = string
    default = "ami-022d03f649d12a49d"
}

variable "my_instance_type" {
  description = "The ec2_instance type"
  type = list(string)
  default = [ "t2.micro", "t2.medium" ]
}


variable "key_pair" {
  description = "my ec2_key pair"
  type = string
  default = "base"
}

variable "ingressrules" {
  description = "my security group inbound rules"
  type = list(number)
  default = [80, 22, 8080,]
}

variable "egressrules" {
  description = "my sercurity grroup outbound rules"
  type = list(number)
   default = [ 80, 22, 8080 ]
}
