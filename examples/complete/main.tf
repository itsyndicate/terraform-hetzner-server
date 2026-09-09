#-----------------------------------------------------------------------------------------------------------------------
# Server
#-----------------------------------------------------------------------------------------------------------------------
module "server" {
  source = "../../"

  name        = "example-complete"
  server_type = "cpx22"
  location    = "nbg1"
  image       = "debian-12"

  ssh_keys     = ["example-key"]
  firewall_ids = ["1889201"]

  public_ipv4_enabled = true
  protection          = true

  placement_group_create = true
  placement_group_name   = "example-spread"

  labels = {
    Environment = "example"
    ManagedBy   = "Terraform"
  }
}
