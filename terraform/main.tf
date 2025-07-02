terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.78.2"
    }
  }
}

provider "proxmox" {
  endpoint   = var.pm_api_url
  api_token  = var.pm_api_token
  insecure   = true
}

locals {
  vm_configs = {
    "vd-fp-dck-01" = 110
    "vd-gx-dck-01" = 111
    "vd-rv-dck-01" = 112
    "vp-sb-dck-01" = 113
  }
}

resource "proxmox_virtual_environment_vm" "vm" {
  for_each = local.vm_configs

  node_name = var.node_name
  vm_id     = each.value
  name      = each.key

  clone {
    vm_id = 901
    full  = true
  }

  cpu {
    cores   = 2
    sockets = 1
    type    = "host"
  }

  memory {
    dedicated = 2048
  }

  bios          = "seabios"
  scsi_hardware = "virtio-scsi-single"
  boot_order    = ["scsi0", "ide2"]

  operating_system {
    type = "l26"
  }

  agent {
    enabled = true
  }

  disk {
    interface     = "scsi0"
    size          = 32
    datastore_id  = var.storage
    file_format   = "qcow2"
    cache         = "writeback"
    iothread      = true
  }

  cdrom {
    interface = "ide2"
    file_id   = "local-lvm:vm-901-cloudinit"
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  initialization {
    interface = "ide2"

    ip_config {
      ipv4 {
        address = "192.168.40.${each.value}/24"
        gateway = "192.168.40.1"
      }
    }

    user_account {
      username = "chiyonn"
      keys     = [file(var.ssh_key_path)]
    }
  }
}
