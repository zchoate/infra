# Home Infra Repo
My home lab infra repo. Keeping it public to keep me honest and prevent shortcuts ;-)

### Ansible
- Roles
    - bootstrap-proxmox
        - Create a template VM in Proxmox
    - new-user
        - Create a new user on a machine and add a key

### Docker-Compose
- Network Services (core services required for life)
    - Home Assistant
    - Omada Wireless controller (based on https://github.com/mbentley/docker-omada-controller)
    - PiHole/DNS

### Cloud-Init
- base-template.yaml
    - Base cloud init template to add keys, users, and get the Qemu agent installed for Proxmox

### Terraform
- Create servers and update inventory file

### TODO:
- [ ] Get inventory file to the appropriate location
- [ ] CI/CD...probably actions for the Terraform, not sure for ansible...probably manual/cron for now
