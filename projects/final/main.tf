module "vpc" {
  source              = "../../modules/vpc"
  public_subnets_ids  = module.subnet.public_subnets_ids
  private_subnets_ids = module.subnet.private_subnets_ids
  cidr_block          = var.placeholder_address
}

module "subnet" {
  source             = "../../modules/subnet"
  vpc_id             = module.vpc.vpc_id
  availability_zones = var.availability_zones
}

module "security_group" {
  source = "../../modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source             = "../../modules/ec2"
  subnet_id          = module.subnet.public_subnets_ids[1]
  security_group_ids = [module.security_group.bastion_sg_id]
  dependency         = [module.vpc.igw_id]
}

module "launch_template" {
  source                 = "../../modules/launch_template"
  vpc_security_group_ids = [module.security_group.web_sg_id]
}

module "alb" {
  source         = "../../modules/alb"
  alb_sg         = [module.security_group.alb_sg_id]
  alb_subnets    = module.subnet.public_subnets_ids
  s3_bucket_name = var.s3_name
  vpc_id         = module.vpc.vpc_id
  target_ids     = module.ec2.instance_ids
}

module "auto_scaling_group" {
  source              = "../../modules/asg"
  launch_template_id  = module.launch_template.launch_template_id
  lb_target_group_arn = module.alb.alb_target_group_arn
  subnet_ids          = module.subnet.private_subnets_ids
  alb_id              = module.alb.alb_id
}

module "rds" {
  source                 = "../../modules/rds"
  vpc_security_group_ids = [module.security_group.rds_sg_id]
  subnet_ids             = module.subnet.rds_subnets_ids
  rds_username = var.secrets_rds_username
  rds_password = var.secrets_rds_password
}

module "dynamo" {
  source = "../../modules/dynamodb"
  dynamodb_name = var.dynamodb_name
}