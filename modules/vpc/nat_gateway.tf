resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.eip.allocation_id
  subnet_id     = var.public_subnets_ids[0]

  tags = {
    Name = "steven-ngw"
  }

  depends_on = [aws_internet_gateway.igw]
}

