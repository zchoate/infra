resource "proxmox_vm_qemu" "servers" {
    for_each    = var.servers
    name        = each.value.name
    desc        = each.value.description
    target_node = each.value.target_node
    
    clone       = var.base_vm
    full_clone  = true
    os_type     = "cloud-init"

    boot        = "cd"
    disk {
        storage = "local-lvm"
        type    = "virtio"
        size    = each.value.disk_size
    }

    network {
        bridge  = "vmbr0"
        model   = "virtio"
    }

    // cloud init bits
    ipconfig0   = "gw=${each.value.ip_gw},ip=${each.value.ip}/${each.value.ip_mask}"
    nameserver  = each.value.ip_nameservers
    cicustom    = "user=local:snippets/${each.value.cloud_init_file}"
}

// build ansible inventory file
resource "local_file" "proxmox_hosts" {
    content = templatefile("proxmox.tmpl", { 
        kubernetes_hosts = tomap({
            for ip, server in var.servers: ip => server
                if contains(server.ansible_groups, "kubernetes")
            })
    })
    filename = "inventory.yaml"
}