output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_arn" {
  value = aws_vpc.vpc.arn
}

output "default_route_table_id" {
  value = aws_vpc.vpc.default_route_table_id
}

output "ngw_id" {
  value = aws_nat_gateway.ngw.id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}