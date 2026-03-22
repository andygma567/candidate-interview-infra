run "basic_example_outputs_exist" {

  assert {
    condition     = output.droplet_ipv4_address != ""
    error_message = "Droplet did not receive a public IPv4 address."
  }

  assert {
    condition     = output.volume_id != ""
    error_message = "Block storage volume was not created."
  }
}
