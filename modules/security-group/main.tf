resource "aws_security_group" "this" {
  name_prefix = var.name
  vpc_id      = var.vpc_id

  ingress = [
    for rule in var.inbound_rules :
    {
      from_port   = rule.from_port
      to_port     = rule.to_port
      protocol    = rule.protocol
      cidr_blocks = rule.cidr_blocks
    }
  ]

  egress = [
    for rule in var.outbound_rules :
    {
      from_port   = rule.from_port
      to_port     = rule.to_port
      protocol    = rule.protocol
      cidr_blocks = rule.cidr_blocks
    }
  ]
}
