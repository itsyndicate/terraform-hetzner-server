#-----------------------------------------------------------------------------------------------------------------------
# Data
#-----------------------------------------------------------------------------------------------------------------------
data "hcloud_network" "network" {
  count = var.network_id != null ? 1 : 0
  id    = var.network_id
}


#-----------------------------------------------------------------------------------------------------------------------
# Placement Group
#-----------------------------------------------------------------------------------------------------------------------
resource "hcloud_placement_group" "this" {
  count = var.placement_group_create ? 1 : 0

  name = var.placement_group_name
  type = "spread"

  labels = var.labels
}


#-----------------------------------------------------------------------------------------------------------------------
# Single Server
#-----------------------------------------------------------------------------------------------------------------------
resource "hcloud_server" "this" {
  name         = var.name
  image        = var.image
  server_type  = var.server_type
  location     = var.location
  ssh_keys     = var.ssh_keys
  firewall_ids = var.firewall_ids

  placement_group_id = length(hcloud_placement_group.this) > 0 ? hcloud_placement_group.this[0].id : null

  backups = var.backups

  # Hetzner requires both attributes to hold the same value.
  delete_protection  = var.protection
  rebuild_protection = var.protection

  keep_disk = var.keep_disk
  labels    = var.labels

  # Configures network
  dynamic "network" {
    for_each = var.network_id != null ? [var.network_id] : []

    content {
      network_id = network.value
      ip         = cidrhost(try(var.server_subnet, data.hcloud_network.network[0].ip_range), 10)
    }
  }

  # Configures public net setting
  public_net {
    ipv4_enabled = var.public_ipv4_enabled
    ipv4         = var.primary_ipv4_id
    ipv6_enabled = var.public_ipv6_enabled
  }

  # Prevents destroying the server if a user changes
  # any of the attributes that force to recreate the servers.
  lifecycle {
    ignore_changes = [
      ssh_keys,
      image
    ]
  }
}
