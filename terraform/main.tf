terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.38.0"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_api_url

  api_token = {
    id     = var.client_id
    secret = var.client_secret
  }

  insecure = var.skip_tls_verify
}

resource "proxmox_vm_qemu" "vm" {
  for_each = { for vm in var.vm_list : vm.name => vm }

  name      = each.value.name
  vm_id     = each.value.vmid
  node_name = "vm"
  clone     = "noble-cloudinit-template"
  full_clone = true
  on_boot   = true

  agent {
    enabled = true
  }

  cpu {
    cores = 2
    type  = "host"
  }

  memory {
    dedicated = 2048
  }

  disk {
    slot        = 0
    size        = 32
    storage     = "local-lvm"
    file_format = "raw"
    interface   = "scsi0"
    type        = "disk"
  }

  network_device {
    model  = "virtio"
    bridge = "vmbr0"
  }

  serial_device {
    id   = 0
    type = "socket"
  }

  vga {
    type = "serial0"
  }

  bios = "ovmf"

  operating_system {
    type = "l26"
  }

  cloud_init {
    user_data = <<EOF
#cloud-config
hostname: ${each.value.name}
users:
  - name: chiyonn
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    shell: /bin/bash
    lock_passwd: false
    passwd: "${var.chiyonn_encrypted_password}"
    ssh_authorized_keys:
      - ${file(var.ssh_key_path)}
disable_root: false
ssh_pwauth: true
EOF

    ip_config {
      ipv4 = {
        address = "${each.value.ip}/24"
        gateway = "192.168.40.1"
      }
    }
  }
}
