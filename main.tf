terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

module "security-group" {
  source = "./modules/security-group"
  vpc_id = var.aws_vpcid

}


module "ec2" {
  source        = "./modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
  # security_group_id = output.security_group_id
  vpc_id    = var.aws_vpcid
  subnet_id = var.subnet_id
}

module "application_load_balancer" {
  source            = "./modules/alb"
  security_group_id = module.security-group.security_group_id
  subnet_id         = var.subnet_id
 # vpc_id            = var.aws_vpcid.vpc_id
}