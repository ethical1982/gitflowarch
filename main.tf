provider "aws" {
region = "us-east-1"
access_key = "AKIA2HH2KNF4D5ZKB4A5"
secret_key = "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"
}

resource "aws_instance" "Amazon_linux" {
ami = "ami-0c2b8ca1dad447f8a"
instance_type = "t2.micro"
tags { name = "AMAZON_LINUX"}
}

resource "aws_security_group" "TFsg" {
  name        = "TFsg"
  description = "Allow TLS inbound traffic"

  ingress = [
    {
      description      = "TLS from VPC"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["10.30.0.0/16"]
      }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      }
  ]

  tags = {
    Name = "allow_tls"
  }
}

