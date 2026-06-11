output "droplet_ids" {
  value       = { for d in digitalocean_droplet.interview_vm : d.name => d.id }
  description = "Map of interview VM droplet names to IDs."
}

output "droplet_ipv4_addresses" {
  value       = { for d in digitalocean_droplet.interview_vm : d.name => d.ipv4_address }
  description = "Map of interview VM droplet names to public IPv4 addresses."
}

output "droplet_private_ips" {
  value       = { for d in digitalocean_droplet.interview_vm : d.name => d.ipv4_address_private }
  description = "Map of interview VM droplet names to private IPv4 addresses."
}

output "volume_ids" {
  value       = { for v in digitalocean_volume.interview_storage : v.name => v.id }
  description = "Map of block storage volume names to IDs."
}

output "hosts_ini" {
  value       = local.hosts_ini
  description = "Populated Primus-SaFE Bootstrap/hosts.ini; paste into ~/Primus-SaFE/Bootstrap/hosts.ini on VM1."
}
