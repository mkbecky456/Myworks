#Security Groups

resource "aws_security_group" "Becky_sg" {
    name = "Becky_sg"
    description = "allow access within this vpc"
    vpc_id  = aws_vpc.beck-vpc.id


#inbound rule
 dynamic "ingress" {
    for_each = var.ingressrules
    content {
        from_port = ingress.value
        to_port = ingress.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]


    }
}


  egress { 
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  
  tags = {
    Name = "becky_SG"
}
}
