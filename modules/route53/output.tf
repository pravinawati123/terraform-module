output "record_fqdn" {
  value = "${var.record_name}.${var.zone_name}"
}
