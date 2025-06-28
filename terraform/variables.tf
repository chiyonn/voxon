variable "proxmox_api_url" {
  description = "Proxmox API endpoint"
  type        = string
}

variable "client_id" {
  description = "API token ID"
  type        = string
}

variable "client_secret" {
  description = "API token secret"
  type        = string
}

variable "skip_tls_verify" {
  description = "Whether to skip TLS verification (useful for self-signed certs)"
  type        = bool
  default     = true
}

variable "vm_list" {
  description = "List of VMs to create"
  type = list(object({
    name   = string
    ip     = string
  }))
}

variable "ssh_key_path" {
  description = "Path to the SSH public key for cloud-init"
  type        = string
}

