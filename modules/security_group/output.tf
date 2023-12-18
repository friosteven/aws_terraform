output "bastion_sg_id" {
  value = aws_security_group.bastion_sg.id
}

output "web_sg_id" {
  value = aws_security_group.web_sg.id
}

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}

output "bastion_sg_name" {
  value = aws_security_group.bastion_sg.name
}

output "web_sg_name" {
  value = aws_security_group.web_sg.name
}

output "alb_sg_name" {
  value = aws_security_group.alb_sg.name
}

output "rds_sg_name" {
  value = aws_security_group.rds_sg.name
}

# output "rdsmysql_sg_id" {
#   value = aws_security_group.mysql_sg.id
# }