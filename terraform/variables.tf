variable "pm_api_url" {
  type = string
}
variable "pm_api_token" {
  type = string
  sensitive = true
}

variable "node_name" {
  type = string
}

variable "storage" {
  type = string
}

variable "ssh_key_path" {
  type = string
}
