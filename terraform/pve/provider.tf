terraform {
    required_providers {
        ansible = {
            source  = "ansible/ansible"
            version = "~> 1.1.0"
        }
        proxmox = {
            source  = "Telmate/proxmox"
            version = "2.9.14"
        }
    }
}

provider "proxmox" {
    pm_api_url = "https://chpve02.home.choate.network:8006/api2/json"
}