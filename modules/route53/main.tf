  data "aws_route53_zone" "hosted_zone" {
    name = var.domain_name
}

    resource "aws_route53_record" "site_domain" {
      zone_id = data.aws_route53_zone.hosted_zone.zone_id
      name    = var.record_name
      type    = "CNAME"
      ttl     = "300"
      alias {
        name                   = aws_lb.application_load_balancer.dns_name
        zone_id                = aws_lb.application_load_balancer.zone_id
        evaluate_target_health = true
        }
    }