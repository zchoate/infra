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
                size    = "120G"
                slot    = 1
            }
        }
        disk_size       = "20G"
        data_disk       = "120G"
        ip_gw           = "192.168.8.1"
        ip              = "192.168.8.41"
        ip_mask         = "24"
        ip_nameservers  = "192.168.8.100"
        cloud_init_file = "base-template.yaml"
    }
}