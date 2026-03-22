resource "digitalocean_droplet" "interview_vm" {
  name       = var.droplet_name
  region     = var.region
  size       = var.droplet_size
  image      = var.droplet_image
  monitoring = var.enable_monitoring
  ssh_keys   = var.ssh_key_ids
  tags       = var.tags
}

resource "digitalocean_volume" "interview_storage" {
  name                     = "${var.droplet_name}-storage"
  region                   = var.region
  size                     = var.volume_size_gb
  initial_filesystem_type  = "ext4"
  description              = "ext4-formatted block storage volume for the interview VM."
  tags                     = var.tags
}

resource "digitalocean_volume_attachment" "interview_storage_attachment" {
  droplet_id = digitalocean_droplet.interview_vm.id
  volume_id  = digitalocean_volume.interview_storage.id
}
