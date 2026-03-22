terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
  required_version = "~> 1.6"
}

provider "digitalocean" {
  # Token is read from the DIGITALOCEAN_TOKEN environment variable
}

# Pass in SSH key IDs from environment for testing if needed.
variable "ssh_key_ids" {
  type    = list(string)
  default = []
}

module "basic_example" {
  source = "../../"

  droplet_name   = "interview-vm-example"
  region         = "nyc1"
  droplet_size   = "s-1vcpu-1gb"
  volume_size_gb = 10
  ssh_key_ids    = var.ssh_key_ids
  tags           = ["interview", "example"]
}

output "droplet_ipv4_address" {
  value = module.basic_example.droplet_ipv4_address
}

output "volume_id" {
  value = module.basic_example.volume_id
}
