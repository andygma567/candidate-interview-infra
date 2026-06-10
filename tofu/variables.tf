variable "region" {
  description = "DigitalOcean region in which to create resources."
  type        = string
  default     = "nyc1"
}

variable "droplet_name_prefix" {
  description = "Prefix for interview VM droplet names."
  type        = string
  default     = "interview-vm"
}

variable "droplet_count" {
  description = "Number of interview VM droplets to create."
  type        = number
  default     = 3
}

variable "droplet_image" {
  description = "OS image slug for the droplet."
  type        = string
  default     = "ubuntu-22-04-x64"
}

variable "droplet_size" {
  description = "Droplet size slug (CPU/RAM) for the interview VM."
  type        = string
  default     = "s-4vcpu-8gb"
}

variable "volume_size_gb" {
  description = "Size in GB of the block storage volume attached to each interview VM."
  type        = number
  default     = 1
}

variable "enable_monitoring" {
  description = "Enable DigitalOcean droplet monitoring."
  type        = bool
  default     = false
}

variable "tags" {
  description = "List of tags to apply to all created resources."
  type        = list(string)
  default     = ["interview"]
}
