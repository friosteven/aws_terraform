resource "aws_route_table_association" "rt_association_igw" {
  count          = 2
  subnet_id      = var.public_subnets_ids[count.index]
  route_table_id = aws_route_table.route_table_igw.id
}

resource "aws_route_table_association" "rt_association_ngw" {
  count          = 2
  subnet_id      = var.private_subnets_ids[count.index]
  route_table_id = aws_route_table.route_table_ngw.id
}