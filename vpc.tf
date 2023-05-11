resource "aws_vpc" "beck-vpc" { 
  cidr_block = "10.0.0.0/24"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    "Name" = "beck_vpc"
  }
}

data "aws_vpc" "existing_vpc" {
  default = true
}
resource "aws_subnet" "becky-pri-subnet" {
  vpc_id = aws_vpc.beck-vpc.id
  cidr_block = "10.0.0.0/25"
  availability_zone = var.my_AZ[1]


  tags = {
    "Name" = "becky30_priv_subnet"
  }
}

resource "aws_subnet" "becky_pub_subnet" {
    vpc_id = aws_vpc.beck-vpc.id
    cidr_block = "10.0.0.128/25"
    availability_zone = var.my_AZ[2]
     #This is what makes the public subnet

tags = {
  "Name" = "becky_pub_subnet"
 }
} 

output "private_subnet_id" {
  description = "my private subnet id"
  value = aws_subnet.becky-pri-subnet.id
}

output "public_subnet_id" {
  description = "my public subnet id"
  value = aws_subnet.becky_pub_subnet.id
}
