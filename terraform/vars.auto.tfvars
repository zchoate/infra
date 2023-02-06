base_vm = "VM 9000"
servers = {
    chk3s01 = {
        name            = "chk3s01"
        description     = "chk3s01"
        target_node     = "chpve01"
        disk_size       = "20G"
        data_disk       = "80G"
        ip_gw           = "192.168.8.1"
        ip              = "192.168.8.41"
        ip_mask         = "24"
        ip_nameservers  = "1.1.1.1,8.8.8.8"
        cloud_init_file = "base-template.yaml"
    }
}