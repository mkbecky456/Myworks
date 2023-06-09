provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ec2_demo" {
  ami = "ami-022d03f649d12a49d"
  instance_type = var.my_instance_type
  vpc_security_group_ids = [aws_security_group.Becky_sg.id]
  subnet_id = aws_subnet.becky_pub_subnet.id
  user_data = file ("app-intall.sh")
  key_name = var.key_pair

  tags = {
    "Name" = "demo"
  }
}