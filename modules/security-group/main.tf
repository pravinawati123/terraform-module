#Create Security group
resource "aws_security_group" "demo_sg" {
  name =  "security group using Terraform module"
  description = "Security group using Terraform"
  vpc_id = var.vpc_id

  tags = {
    Name = "VIP_SG"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}