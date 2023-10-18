resource "yandex_api_gateway" "this" {
  name = "${var.hack_name}-apigw"
  spec = <<-EOT
    openapi: "3.0.0"
    info:
      version: 0.1.0
      title: API ${var.hack_name}
    paths:
      /:
        get:
          summary: Get status
          operationId: getStatus
          responses:
            '200':
              description: UP
              content:
                'application/json':
                  schema:
                    type: object
                    properties:
                      status:
                        type: string
          x-yc-apigateway-integration:
            type: dummy
            http_code: 200
            content:
              "application/json": "{ \"status\": \"UP\" }"
  EOT
}
