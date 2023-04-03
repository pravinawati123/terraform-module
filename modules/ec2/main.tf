resource "aws_instance" "ec2_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data              = var.user_data
  root_block_device {
    volume_size = 8
  }

  lifecycle {
    create_before_destroy = true
  }

  # Name the EC2 instance using the "Name" tag
  tags = merge(
    var.instance_tags,
    {
      "Name" = var.instance_name
    }
  )
}
