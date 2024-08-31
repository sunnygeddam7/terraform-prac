output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_id" {
  value = aws_subnet.subent1.id
}

output "sg1" {
  value = aws_security_group.sg.id
}