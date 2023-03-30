variable "domain_name" {
  type = string
  description = "The domain name to use for your Route53 configuration"
}

/* variable "hosted_zone" {
  type = string

} */

variable "record_zone_id" {
  type  = string
  description = "The ID of the Route53 zone where you want to create records"

}

variable "record_name" {
  type  = string

}

variable "record_type" {
  type  = string

}

variable "record_ttl" {
  type  = string

}

variable "record_value" {

}