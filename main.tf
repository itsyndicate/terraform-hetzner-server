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
resource "random_string" "server" {
  length  = 4
  lower   = true
  special = false
  numeric = false
  upper   = false

  keepers = {
    # We re-create the apart of the name changes.
    name = var.name
  }
}

resource "hcloud_server" "this" {
  count = var.server_count != null ? var.server_count : 1

  name         = "${var.name}-${random_string.server.result}-${count.index}"
  image        = var.image
  server_type  = var.server_type
  location     = var.location
  ssh_keys     = var.ssh_keys
  firewall_ids = var.firewall_ids

  placement_group_id = length(hcloud_placement_group.this) > 0 ? hcloud_placement_group.this[0].id : null

  backups = var.backups

  # user_data          = data.cloudinit_config.config.rendered

  keep_disk = var.keep_disk
  labels    = var.labels

  # Configures network
  dynamic "network" {
    for_each = var.network_id != null ? [var.network_id] : []

    content {
      network_id = network.value
      ip = cidrhost(try(var.server_subnet, data.hcloud_network.network[0].ip_range ), count.index + 10)
    }
  }

  # Configures public net setting
  public_net {
    ipv4_enabled = var.public_ipv4_enabled
    ipv6_enabled = var.public_ipv6_enabled
  }

  # Prevents destroying the server if a user changes
  # any of the attributes that force to recreate the servers.
  lifecycle {
    ignore_changes = [
      ssh_keys,
      user_data,
      image
    ]
  }
}


# data "cloudinit_config" "config" {
#   gzip          = true
#   base64_encode = true
#
#   # Main cloud-config configuration file.
#   part {
#     filename     = "init.cfg"
#     content_type = "text/cloud-config"
#     content = templatefile(
#       "${path.module}/templates/cloudinit.yaml.tpl",
#       {
#         hostname                     = local.name
#         sshAuthorizedKeys = concat([var.ssh_public_key], var.ssh_additional_public_keys)
#         cloudinit_write_files_common = var.cloudinit_write_files_common
#         cloudinit_runcmd_common      = var.cloudinit_runcmd_common
#         swap_size                    = var.swap_size
#       }
#     )
#   }
# }
