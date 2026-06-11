resource "digitalocean_droplet" "interview_vm" {
  count      = var.droplet_count
  name       = "${var.droplet_name_prefix}-${count.index + 1}"
  region     = var.region
  size       = var.droplet_size
  image      = var.droplet_image
  monitoring = var.enable_monitoring
  tags       = var.tags

  user_data = <<-EOF
    #cloud-config
    ssh_pwauth: true
    disable_root: false
    chpasswd:
      expire: false
      users:
        - name: root
          password: ${var.root_password}
          type: text
  EOF
}

resource "digitalocean_volume" "interview_storage" {
  count                   = var.droplet_count
  name                    = "${var.droplet_name_prefix}-${count.index + 1}-storage"
  region                  = var.region
  size                    = var.volume_size_gb
  initial_filesystem_type = "ext4"
  tags                    = var.tags
}

resource "digitalocean_volume_attachment" "interview_storage_attachment" {
  count      = var.droplet_count
  droplet_id = digitalocean_droplet.interview_vm[count.index].id
  volume_id  = digitalocean_volume.interview_storage[count.index].id
}
