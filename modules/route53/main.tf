resource "aws_route53_zone" "zone" {
  name      = var.domain_name
}

resource "aws_route53_record" "record" {

  name      = var.record_name
  type      = var.record_type
  ttl       = var.record_ttl
  records   = [ var.record_value[0] ]
  zone_id   = var.record_zone_id
}
