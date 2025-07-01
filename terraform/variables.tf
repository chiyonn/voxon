variable "proxmox_api_url" {
  description = "Proxmox API endpoint (e.g. https://proxmox.example.com:8006/api2/json)"
  type        = string
}

variable "client_id" {
  description = "Proxmox API token ID (e.g. root@pam!terraform)"
  type        = string
}

variable "client_secret" {
  description = "Proxmox API token secret"
  type        = string
}

variable "skip_tls_verify" {
  description = "Whether to skip TLS verification (for self-signed certs)"
  type        = bool
  default     = true
}

variable "vm_list" {
  description = "List of VMs to create"
  type = list(object({
    name = string
    ip   = string
    vmid = number
  }))
}

variable "ssh_key_path" {
  description = "Path to the SSH public key file used by cloud-init"
  type        = string
}

variable "chiyonn_encrypted_password" {
  description = "Encrypted password for chiyonn user (SHA-512 hash, from openssl passwd -6)"
  type        = string
}
