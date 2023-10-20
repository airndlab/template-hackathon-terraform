resource "yandex_serverless_container" "py_app" {
  service_account_id = var.service_account_id
  name               = "${var.hack_name}-py-app"
  memory             = 128
  image              = {
    url = "cr.yandex/${yandex_container_registry.this.id}/airndlab/template-hackathon-python-fastapi:0.1.0"
  }
}
