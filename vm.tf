data "yandex_compute_image" "container_optimized_image" {
  # https://cloud.yandex.com/en-ru/marketplace/products/yc/container-optimized-image
  family = "container-optimized-image"
}

resource "yandex_compute_instance" "this" {
  # https://cloud.yandex.com/en/docs/compute/concepts/vm-platforms#standard-platforms
  platform_id               = "standard-v3"
  name                      = "${var.hack_name}-vm"
  zone                      = "ru-central1-b"
  allow_stopping_for_update = true

  resources {
    cores  = 10
    memory = 10
  }

  boot_disk {
    initialize_params {
      # https://cloud.yandex.com/en/docs/compute/concepts/disk#disks-types
      type     = "network-ssd"
      name     = "${var.hack_name}-disk"
      size     = 100
      image_id = data.yandex_compute_image.container_optimized_image.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.this.id
    nat       = true
  }

  metadata = {
    docker-compose = file("${path.module}/docker-compose.yml")
    user-data      = file("${path.module}/cloud_config.yaml")
  }
}
