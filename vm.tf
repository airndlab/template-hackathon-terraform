data "yandex_compute_image" "container_optimized_image" {
  family = "container-optimized-image"
}

resource "yandex_compute_instance" "this" {
  name = "${var.hack_name}-vm"
  zone = "ru-central1-b"

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.container_optimized_image.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.this.id
    nat       = true
  }

  resources {
    cores  = 2
    memory = 2
  }

  metadata = {
    docker-compose = file("${path.module}/docker-compose.yml")
    user-data      = file("${path.module}/vm_config.yml")
  }
}

output "external_ip" {
  value = yandex_compute_instance.this.network_interface.0.nat_ip_address
}
