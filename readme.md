# Home Infra Repo
My home lab infra repo. Keeping it public to keep me honest and prevent shortcuts ;-)

### Ansible
- Roles
    - bootstrap-proxmox
        - Create a template VM in Proxmox
    - new-user
        - Create a new user on a machine and add a key
    - container-host
        - Install docker, docker-compose
    - deb-updates
        - Run updates and reboot if required

### Docker-Compose
- Network Services (core services required for life)
    - Traefik
    - Home Assistant
    - Omada Wireless controller (based on https://github.com/mbentley/docker-omada-controller)
    - PiHole/DNS
- Paperless

### Cloud-Init
- base-template.yaml
    - Base cloud init template to add keys, users, and get the Qemu agent installed for Proxmox

### Terraform
- Create servers on proxmox and update host inventory (ansible/pve-guests.yaml)
