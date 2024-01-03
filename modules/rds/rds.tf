resource "aws_db_instance" "rds-mysql" {
  allocated_storage      = 100
  db_name                = "steven_rds_mysql"
  engine                 = "mysql"
  engine_version         = "8.0.33"
  instance_class         = "db.t3.micro"
  username               = var.rds_username
  password               = var.rds_password
  parameter_group_name   = "default.mysql8.0"
  identifier             = "steven-rds-mysql"
  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  multi_az               = true
  port                   = 3306
  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "steven-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "steven-db-subnet-group"
  }
}