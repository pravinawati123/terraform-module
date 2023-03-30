output "security_group_id" {
  value = module.security-group.security_group_id

}

output "alb_dns_name" {
  value = module.application_load_balancer.application_load_balancer_dns_name
  
}