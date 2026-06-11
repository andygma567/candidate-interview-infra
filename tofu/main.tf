resource "tls_private_key" "cluster" {
  algorithm = "ED25519"
}

resource "digitalocean_droplet" "interview_vm" {
  count      = var.droplet_count
  name       = "${var.droplet_name_prefix}-${count.index + 1}"
  region     = var.region
  size       = var.droplet_size
  image      = var.droplet_image
  monitoring = var.enable_monitoring
  tags       = var.tags

  user_data = templatefile("${path.module}/cloud-init.yaml.tftpl", {
    root_password   = var.root_password
    ssh_public_key  = trimspace(tls_private_key.cluster.public_key_openssh)
    ssh_private_key = tls_private_key.cluster.private_key_openssh
    is_primary      = count.index == 0
  })
}

resource "digitalocean_volume" "interview_storage" {
  count  = var.droplet_count
  name   = "${var.droplet_name_prefix}-${count.index + 1}-storage"
  region = var.region
  size   = var.volume_size_gb
  tags   = var.tags
}

resource "digitalocean_volume_attachment" "interview_storage_attachment" {
  count      = var.droplet_count
  droplet_id = digitalocean_droplet.interview_vm[count.index].id
  volume_id  = digitalocean_volume.interview_storage[count.index].id
}

locals {
  hosts_ini = templatefile("${path.module}/hosts.ini.tftpl", {
    private_ips = digitalocean_droplet.interview_vm[*].ipv4_address_private
  })
}

resource "local_file" "hosts_ini" {
  content  = local.hosts_ini
  filename = "${path.module}/generated/hosts.ini"
}
