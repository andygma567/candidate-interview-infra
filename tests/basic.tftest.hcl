run "outputs_exist" {

  variables {
    droplet_name   = "interview-vm-test"
    region         = "nyc1"
    droplet_size   = "s-1vcpu-1gb"
    volume_size_gb = 10
    tags           = ["interview", "test"]
  }

  assert {
    condition     = output.droplet_ipv4_address != ""
    error_message = "Droplet did not receive a public IPv4 address."
  }

  assert {
    condition     = output.volume_id != ""
    error_message = "Block storage volume was not created."
  }
}
