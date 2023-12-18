resource "aws_route_table" "route_table_igw" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "steven-route-table-igw"
  }
}

resource "aws_route_table" "route_table_ngw" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = var.cidr_block
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = "steven-route-table-ngw"
  }
}