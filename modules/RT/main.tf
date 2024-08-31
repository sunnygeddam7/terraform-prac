resource "aws_route_table" "RT" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.cidr
    gateway_id = var.igw_id
  }

  tags = {
    Name = "RT"
  }
}

resource "aws_route_table_association" "RTass" {
  route_table_id = aws_route_table.RT.id
  subnet_id = var.subnet_id
}
