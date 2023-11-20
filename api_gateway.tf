resource "yandex_api_gateway" "this" {
  name = "${var.hack_name}-apigw"

  connectivity {
    network_id = yandex_vpc_network.this.id
  }

  custom_domains {
    fqdn           = var.hack_domain
    certificate_id = yandex_cm_certificate.this.id
  }

  spec = <<-EOT
openapi: 3.0.0
info:
  version: 0.1.0
  title: API ${var.hack_name}
paths:
  /{path+}:
    x-yc-apigateway-any-method:
      x-yc-apigateway-integration:
        type: http
        url: http://${yandex_compute_instance.this.network_interface.0.ip_address}:3000/{path}
        headers:
          '*': '*'
        query:
          '*': '*'
      parameters:
      - name: path
        in: path
        required: false
        schema:
          type: string
  EOT
}
