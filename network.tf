resource "yandex_vpc_network" "this" {
  name = "${var.hack_name}-network"
}

resource "yandex_vpc_subnet" "this" {
  name           = "${var.hack_name}-subnet"
  zone           = "ru-central1-b"
  v4_cidr_blocks = ["10.0.0.0/24"]
  network_id     = yandex_vpc_network.this.id
}
