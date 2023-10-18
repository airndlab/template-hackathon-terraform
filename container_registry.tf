resource "yandex_container_registry" "this" {
  name = "${var.hack_name}-cr"
}
