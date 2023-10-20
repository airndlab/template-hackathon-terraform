variable "cloud_id" {
  type        = string
  description = "ID of cloud"
  nullable    = false
  sensitive   = true
}

variable "folder_id" {
  type        = string
  description = "ID of folder in cloud"
  nullable    = false
  sensitive   = true
}

variable "service_account_id" {
  type        = string
  description = "ID of service account in folder"
  nullable    = false
  sensitive   = true
}

variable "service_account_key_file" {
  type        = string
  description = "Path to or content of service account file in json format"
  nullable    = false
  sensitive   = true
}

variable "container_registry_id" {
  type        = string
  description = "ID of container registry id in folder"
  nullable    = false
  sensitive   = true
}

variable "hack_name" {
  type        = string
  description = "Short name of hackathon"
  nullable    = false
  sensitive   = false
}
