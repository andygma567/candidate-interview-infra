# candidate-interview-infra

OpenTofu configuration for a low-cost DigitalOcean interview VM with attached block storage.

## What This Creates

- One DigitalOcean Droplet using a low-cost shared CPU 4 GB RAM size (`s-2vcpu-4gb`)
- One block storage volume (`10` GB by default)
- One volume attachment from the storage volume to the droplet

This setup is password-based only. SSH keys are not configured by this module.

## Prerequisites

1. A DigitalOcean account
2. A DigitalOcean API token
3. OpenTofu installed

Set your token before running OpenTofu:

```bash
export DIGITALOCEAN_TOKEN="your-do-token-here"
```

## Quick Start

From the tofu directory:

```bash
tofu init
tofu plan
tofu apply
```

Get connection details:

```bash
tofu output
```

## Default Configuration

You can override values with a terraform.tfvars file if needed.

```hcl
region         = "nyc1"
droplet_name   = "interview-vm"
droplet_image  = "ubuntu-22-04-x64"
droplet_size   = "s-2vcpu-4gb"
volume_size_gb = 10
enable_monitoring = false
tags           = ["interview"]
```

## Variables

| Variable | Description | Default |
|----------|-------------|---------|
| region | DigitalOcean region | nyc1 |
| droplet_name | Name of the droplet | interview-vm |
| droplet_image | Droplet image slug | ubuntu-22-04-x64 |
| droplet_size | Droplet size slug (shared CPU, 4 GB RAM default) | s-2vcpu-4gb |
| volume_size_gb | Block storage size in GB | 10 |
| enable_monitoring | Enable droplet monitoring | false |
| tags | Tags applied to resources | ["interview"] |

## Outputs

- droplet_id
- droplet_ipv4_address
- droplet_private_ip
- volume_id

## Files

- tofu/main.tf: Droplet, volume, and volume attachment resources
- tofu/variables.tf: Input variables and defaults
- tofu/outputs.tf: Resource outputs
- tofu/providers.tf: Provider and OpenTofu version requirements

