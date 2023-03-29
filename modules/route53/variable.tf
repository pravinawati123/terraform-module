variable "domain_name" {
  type = string
  description = "The domain name to use for your Route53 configuration"
}

/* variable "hosted_zone" {
  type = string

} */

variable "zone_id" {
  type  = string
  description = "The ID of the Route53 zone where you want to create records"

}

variable "records" {
  type        = list(object({
  name        = string
  type        = string
  ttl         = number
  records     = list(string)
  }))
  description = "The list of Route53 records to create"
}