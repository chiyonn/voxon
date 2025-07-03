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

variable "base_template_id" {
  type = number
}

variable "ip_subnet" {
  type    = string
  default = "192.168.40"
}

variable "vm_user" {
  type    = string
  default = "chiyonn"
}
