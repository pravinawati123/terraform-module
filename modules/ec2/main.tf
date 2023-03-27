resource "aws_instance" "ubuntu" {
  ami = var.ami
  instance_type = var.instance_type
#  security_groups = var.security_group_id
subnet_id = var.subnet_id
  tags = {
    Name = "terraform_demo"
  }
}