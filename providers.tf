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
