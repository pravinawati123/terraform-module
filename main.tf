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
  source            = "./modules/ec2"
  ami               = var.ami
  instance_type     = var.instance_type
  security_group_id = module.security-group.security_group_id
  vpc_id            = var.aws_vpcid
  subnet_id         = var.subnet_id1
}

module "application_load_balancer" {
  source             = "./modules/alb"
  security_group_id  = module.security-group.security_group_id
  subnet_id1         = var.subnet_id1
  subnet_id2         = var.subnet_id2
  vpc_id             = var.aws_vpcid
  target_group_port  = 80
  listener_port      = 80
  listener_protocol  = "HTTP"
  instance_target_id = module.ec2.id

}

module "route" {
  source = "./modules/route53"
  domain_name    = var.domain_name
  record_name    = var.record_name
  record_type    = var.record_type
  record_ttl     = var.record_ttl
  record_value   = [var.record_value]
  record_zone_id = var.record_zone_id
}
