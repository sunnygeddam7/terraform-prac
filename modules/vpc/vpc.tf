resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.name
  }
}

resource "aws_subnet" "subent1" {
  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.vpc.id
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.vpc.id
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false
}

resource "aws_security_group" "sg" {
  name = "sg1"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port = 22
    to_port = 22
    description = "ssh"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    description = "http"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

