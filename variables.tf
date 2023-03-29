

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

variable "subnet_id1" {
  type    = string
  default = "subnet-0cd4b109ea9143fff"

}

variable "subnet_id2" {
  type    = string
  default = "subnet-0c91c2f234d1c70d2"

}

variable "target_id" {
  type    = string
  default = "i-0522299a193afb609"

}

# Route 53 variables
variable "domain_name" {
  default     = "centrictest.com"
  description = "domain name"
  type        = string

}

variable "record_name" {
  default     = "www"
  description = "sub domain name"
  type        = string

}