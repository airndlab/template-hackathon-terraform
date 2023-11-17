output "vm_ip" {
  value = yandex_compute_instance.this.network_interface.0.nat_ip_address
}

output "api_gateway_domain" {
  value = yandex_api_gateway.this.domain
}
