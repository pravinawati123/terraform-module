/* output "name_server" {
    value = aws_route53_zone.hosted_zone.name_servers
  
} */

output "zone_id" {
  value = aws_route53_zone.zone.id
}

output "record_names" {
  value = [for record in var.records : record.name]
}