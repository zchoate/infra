resource "proxmox_vm_qemu" "servers" {
    for_each    = var.servers
    name        = each.value.name
    desc        = each.value.description
    target_node = each.value.target_node
    
    clone       = var.base_vm
    full_clone  = true
    os_type     = "cloud-init"

    boot        = "cd"

    memory      = each.value.memory_mb

    dynamic "disk" {
        for_each = each.value.disks

        content {
            storage = disk.value["storage"]
            type    = disk.value["type"]
            size    = disk.value["size"]
            slot    = disk.value["slot"]
        }
    }

    network {
        bridge  = "vmbr0"
        model   = "virtio"
    }

    // cloud init bits
    ipconfig0   = "gw=${each.value.ip_gw},ip=${each.value.ip}/${each.value.ip_mask}"
    nameserver  = each.value.ip_nameservers
    cicustom    = "user=local:snippets/${each.value.cloud_init_file}"

    lifecycle {
      ignore_changes = [ agent, qemu_os ]
    }
}

resource "ansible_host" "servers" {
    for_each    = var.servers
    
    name        = each.value.name
    groups      = each.value.groups
    variables   = {
        ansible_user                    = "zach",
        ansible_host                    = each.value.ip,
        ansible_ssh_private_key_file    = "~/.ssh/id_rsa",
        ansible_python_interpreter      = "/usr/bin/python3",
        docker_user                     = "zach",
        second_disk_path                = each.value.mount_second_disk ? "/dev/vdb" : null,
        hostname                        = each.value.name
    }
}

resource "pihole_dns_record" "servers" {
    for_each    = var.servers

    domain      = "${each.value.name}.${var.local_domain}"
    ip          = each.value.ip
}