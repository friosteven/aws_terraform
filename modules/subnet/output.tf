output "public_subnets_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "private_subnets_ids" {
  value = aws_subnet.private_subnets[*].id
}

output "rds_subnets_ids" {
  value = aws_subnet.rds_subnets[*].id
}
