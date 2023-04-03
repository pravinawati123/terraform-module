variable "instance_name" {
  type    = string
  default = "my-instance"
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "subnet_id" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "user_data" {
  type    = string
  default = ""
}

variable "instance_tags" {
  type    = map(string)
  default = {}
}
