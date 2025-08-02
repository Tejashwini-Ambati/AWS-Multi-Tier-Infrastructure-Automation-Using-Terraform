provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr          = var.vpc_cidr
  public_subnets    = var.public_subnets
  private_subnets   = var.private_subnets
  availability_zones = var.availability_zones
}

module "alb" {
  source = "./modules/alb"

  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
}

module "ec2" {
  source = "./modules/ec2"

  vpc_id                = module.vpc.vpc_id
  private_subnet_ids    = module.vpc.private_subnet_ids
  alb_target_group_arn  = module.alb.target_group_arn
  alb_security_group_id = module.alb.alb_security_group_id
}

module "rds" {
  source = "./modules/rds"

  vpc_id               = module.vpc.vpc_id
  private_subnet_ids   = module.vpc.private_subnet_ids
  ec2_security_group_id = module.ec2.ec2_sg_id
  db_username          = var.db_username
  db_password          = var.db_password
}