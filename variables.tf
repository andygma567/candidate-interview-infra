variable "region" {
  description = "DigitalOcean region in which to create resources."
  type        = string
  default     = "nyc1"
}

variable "droplet_name" {
  description = "Name of the interview VM droplet."
  type        = string
  default     = "interview-vm"
}

variable "droplet_image" {
  description = "OS image slug for the droplet."
  type        = string
  default     = "ubuntu-22-04-x64"
}

variable "droplet_size" {
  description = "Droplet size slug (CPU/RAM) for the interview VM."
  type        = string
  default     = "s-2vcpu-4gb"
}

variable "volume_size_gb" {
  description = "Size in GB of the raw block storage volume attached to the interview VM."
  type        = number
  default     = 50
}

variable "ssh_key_ids" {
  description = "List of SSH key IDs (from DigitalOcean) to add to the droplet."
  type        = list(string)
  default     = []
}

variable "enable_monitoring" {
  description = "Enable DigitalOcean droplet monitoring."
  type        = bool
  default     = true
}

variable "tags" {
  description = "List of tags to apply to all created resources."
  type        = list(string)
  default     = ["interview"]
}
