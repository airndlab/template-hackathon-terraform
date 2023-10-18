terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  service_account_key_file = var.service_account_key_file
}

data "yandex_container_registry" "this" {
  name = "${var.hack_name}-cr"
}
