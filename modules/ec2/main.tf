resource "aws_instance" "ec2" {
  ami = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"
  key_name = "new"
  vpc_security_group_ids = [var.sg_id]
  subnet_id = var.subnet_id
  tags = {
    Name = "cherry"
  }

}