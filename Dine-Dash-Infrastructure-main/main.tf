terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
  # token      = var.aws_session_token
}

module "vpc" {
  source = "./vpc"
}

module "sg" {
  source     = "./sg"
  vpc_id     = module.vpc.vpc_id
  depends_on = [module.vpc]
}

module "ec2" {
  source         = "./ec2"
  vpc_id         = module.vpc.vpc_id
  instance_sg_id = module.sg.ec2_sg_id
  depends_on     = [module.vpc, module.alb]
}

module "alb" {
  source            = "./alb"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids    = module.vpc.public_subnet_ids
  security_group_id = module.sg.alb_sg_id
}

module "asg" {
  source = "./asg"
  desired_capacity    = 1
  max_size            = 3
  min_size            = 1
  vpc_subnet_ids      = module.vpc.public_subnet_ids
  launch_template_id  = module.ec2.launch_template_id
  target_group_arn    = module.alb.target_group_arn
}
