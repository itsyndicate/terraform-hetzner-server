module "pools" {
  source = "../"

  for_each = var.server_pools

  # Number of servers to be created in the pool
  server_count = try(each.value.server_count, var.defaults.server_count, 1)

  # Standard hcloud_server arguments
  name = try(each.value.name, var.defaults.name, "node")
  server_type = try(each.value.server_type, var.defaults.server_type, "cx22")
  image = try(each.value.image, var.defaults.image, null)
  location = try(each.value.location, var.defaults.location, null)
  datacenter = try(each.value.datacenter, var.defaults.datacenter, null)
  user_data = try(each.value.user_data, var.defaults.user_data, null)
  ssh_keys = try(each.value.ssh_keys, var.defaults.ssh_keys, [])
  keep_disk = try(each.value.keep_disk, var.defaults.keep_disk, false)
  iso = try(each.value.iso, var.defaults.iso, null)
  rescue = try(each.value.rescue, var.defaults.rescue, null)
  labels = try(each.value.labels, var.defaults.labels, {})
  backups = try(each.value.backups, var.defaults.backups, false)
  firewall_ids = try(each.value.firewall_ids, var.defaults.firewall_ids, [])
  placement_group_create = try(each.value.placement_group_create, var.defaults.placement_group_create, false)
  placement_group_name = try(each.value.placement_group_name, var.defaults.placement_group_name, null)
  network_id = try(each.value.network_id, var.defaults.network_id, null)
  public_ipv4_enabled = try(each.value.public_ipv4_enabled, var.defaults.public_ipv4_enabled, false)
  public_ipv6_enabled = try(each.value.public_ipv6_enabled, var.defaults.public_ipv6_enabled, false)

  # TODO: Implement other hcloud_server arguments
  # public_net = try(each.value.datacenter, var.defaults.datacenter)
  # network = try(each.value.network, var.defaults.network, {})
  # delete_protection = try(each.value.datacenter, var.defaults.datacenter, false)
  # rebuild_protection = try(each.value.datacenter, var.defaults.datacenter, false)
  # allow_deprecated_images = try(each.value.datacenter, var.defaults.datacenter, false)
  # shutdown_before_deletion = try(each.value.datacenter, var.defaults.datacenter, false)


}
