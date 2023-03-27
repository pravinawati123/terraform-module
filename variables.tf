

variable "ami" {
  type    = string
  default = "ami-0b029b1931b347543"
}

variable "instance_type" {
  type    = string
  default = "m4.large"
}

variable "aws_vpcid" {
  type    = string
  default = "vpc-0ce955d0ffe0ac126"

}

variable "subnet_id" {
  type    = string
  default = "subnet-0cd4b109ea9143fff"

}

/* variable "security_group_id" {
  type = string
  
} */