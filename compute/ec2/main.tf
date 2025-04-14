provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

module "vpc" {
  source = "./modules/vpc"
  
  vpc_cidr        = var.vpc_cidr
  vpc_name        = var.vpc_name
  subnet_cidrs    = var.subnet_cidrs
  azs             = var.azs
  environment     = var.environment
}

module "security" {
  source = "./modules/security"
  
  vpc_id          = module.vpc.vpc_id
  allowed_ssh_ips = var.allowed_ssh_ips
  environment     = var.environment
}

module "ec2" {
  source = "./modules/ec2"
  
  instance_count      = var.instance_count
  instance_type       = var.instance_type
  subnet_ids          = module.vpc.subnet_ids
  security_group_ids  = [module.security.sg_id]
  ami_id              = var.ami_id
  key_name            = var.key_name
  root_volume_size    = var.root_volume_size
  root_volume_type    = var.root_volume_type
  instance_name       = var.instance_name
  environment         = var.environment
  user_data           = var.user_data
}
