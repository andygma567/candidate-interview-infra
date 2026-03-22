output "droplet_id" {
  value       = digitalocean_droplet.interview_vm.id
  description = "ID of the interview VM droplet."
}

output "droplet_ipv4_address" {
  value       = digitalocean_droplet.interview_vm.ipv4_address
  description = "Public IPv4 address of the interview VM."
}

output "droplet_private_ip" {
  value       = digitalocean_droplet.interview_vm.ipv4_address_private
  description = "Private IPv4 address of the interview VM."
}

output "volume_id" {
  value       = digitalocean_volume.interview_storage.id
  description = "ID of the block storage volume."
}
