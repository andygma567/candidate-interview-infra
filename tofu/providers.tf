terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.68"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.4"
    }
  }
  required_version = "~> 1.10"
}

provider "digitalocean" {
  # Authentication token should be set via DIGITALOCEAN_TOKEN environment variable
  # or through digitalocean provider configuration
}

