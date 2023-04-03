variable "zone_name" {
  description = "Name of the Route 53 hosted zone"
}

variable "record_name" {
  description = "Name of the Route 53 record"
}

variable "record_type" {
  description = "Type of the Route 53 record (A, CNAME, etc.)"
}

variable "record_ttl" {
  default     = 300
  description = "TTL value for the Route 53 record"
}

variable "record_value" {
  description = "Value for the Route 53 record"
}
