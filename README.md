# Voxon Infrastructure

This repository contains Terraform and Ansible code for provisioning and configuring
virtual machines on Proxmox. The directory layout is simple:

- **terraform/** – Terraform configuration for creating VMs.
- **ansible/** – Playbooks and inventory for post-provisioning configuration.

Each subdirectory has its own README with detailed usage instructions.

## Quick start

1. Edit `terraform/terraform.tfvars` to provide required variables such as
   API endpoint and token.
2. Run Terraform to create the VMs.
3. Use Ansible to install Docker and configure the host as described in
   `ansible/README.md`.

