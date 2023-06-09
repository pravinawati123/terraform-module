variable "security_group_id" {
    type = string
}
variable "subnet_id1" {   
    type = string
}

variable "subnet_id2" {   
    type = string
}

variable "vpc_id" {
  type = string
}


variable "listener_port" {
  type = number
}

variable "listener_protocol" {
  type = string
}

variable "target_group_port" {
  type = number
}


variable "instance_target_id" {
  type = string
}

