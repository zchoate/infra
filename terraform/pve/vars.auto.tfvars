base_vm = "ubuntu-2204"
servers = {
    chch01 = {
        name            = "chch01"
        description     = "chch01"
        target_node     = "chpve02"
        groups          = ["container_host"]
        disks = {
            0 = {
                storage = "local-zfs"
                type    = "virtio"
                size    = "20G"
                slot    = 0
            }
            1 = {
                storage = "datapool"
                type    = "virtio"
                size    = "240G"
                slot    = 1
            }
        }
        disk_size       = "20G"
        mount_second_disk = true
        ip_gw           = "192.168.8.1"
        ip              = "192.168.8.41"
        ip_mask         = "24"
        ip_nameservers  = "192.168.8.100"
        cloud_init_file = "base-template.yaml"
    }
    chmedia01 = {
        name            = "chmedia01"
        description     = "chmedia01"
        target_node     = "chpve02"
        groups          = ["container_host"]
        disks = {
            0 = {
                storage = "local-zfs"
                type    = "virtio"
                size    = "50G"
                slot    = 0
            }
            1 = {
                storage = "datapool"
                type    = "virtio"
                size    = "480G"
                slot    = 1
            }
        }
        disk_size       = "50G"
        mount_second_disk = true
        ip_gw           = "192.168.8.1"
        ip              = "192.168.8.42"
        ip_mask         = "24"
        ip_nameservers  = "192.168.8.100"
        cloud_init_file = "base-template.yaml"
    }
    chdisposable = {
        name            = "chdisposable"
        description     = "chdisposable"
        target_node     = "chpve02"
        groups          = ["container_host"]
        disks = {
            0 = {
                storage = "local-zfs"
                type    = "virtio"
                size    = "80G"
                slot    = 0
            }
        }
        disk_size       = "80G"
        mount_second_disk = false
        ip_gw           = "192.168.8.1"
        ip              = "192.168.8.43"
        ip_mask         = "24"
        ip_nameservers  = "192.168.8.100"
        cloud_init_file = "base-template.yaml"
    }
}