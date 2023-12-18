resource "aws_subnet" "public_subnets" {
  count                   = 2
  availability_zone       = element(var.availability_zones, count.index)
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.${count.index + 1}.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.resource_name}-public-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count             = 2
  availability_zone = element(var.availability_zones, count.index)
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.${count.index + 3}.0/24"

  tags = {
    Name = "${var.resource_name}-private-${count.index + 1}"
  }
}

resource "aws_subnet" "rds_subnets" {
  count             = 2
  availability_zone = element(var.availability_zones, count.index)
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.${count.index + 5}.0/24"

  tags = {
    Name = "${var.resource_name}-rds-${count.index + 1}"
  }
}