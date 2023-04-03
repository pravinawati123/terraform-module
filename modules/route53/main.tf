data "aws_route53_zone" "zone" {
  name         = var.zone_name
  private_zone = false
}

resource "aws_route53_record" "record" {
  name = var.record_name
  type = var.record_type
  ttl  = var.record_ttl

  zone_id = data.aws_route53_zone.zone.id

  records = [
    var.record_value,
  ]
}
