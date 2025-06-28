terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = ">= 2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url      = var.proxmox_api_url
  pm_api_token_id = var.client_id
  pm_api_token_secret = var.client_secret
  pm_tls_insecure = var.verify_ssl
}

resource "proxmox_vm_qemu" "vm" {
  for_each = { for vm in var.vm_list : vm.name => vm }

  name   = each.value.name
  target_node = "vm"
  clone  = "ubuntu24.04-server-template"

  cores  = 2
  memory = 2048
  os_type = "cloud-init"

  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  ipconfig0 = "ip=${each.value.ip}/24,gw=192.168.40.1"

  disk {
    size = "32G"
    type = "scsi"
    storage = "local-lvm"
  }

  ciuser = "chiyonn"
  cipassword = ""
  sshkeys = file(var.ssh_key_path)

  agent = 1
}

