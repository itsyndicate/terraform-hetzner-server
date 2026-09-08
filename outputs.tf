#-----------------------------------------------------------------------------------------------------------------------
# Outputs
#-----------------------------------------------------------------------------------------------------------------------
output "id" {
  description = "ID of the Server resource"
  value       = hcloud_server.this.id
}

output "name" {
  description = "Name of the Server resource"
  value       = hcloud_server.this.name
}

output "ipv4_address" {
  description = "Public IPv4 address of the server"
  value       = hcloud_server.this.ipv4_address
}

output "ipv6_address" {
  description = "Public IPv6 address of the server"
  value       = hcloud_server.this.ipv6_address
}

output "status" {
  description = "Status of the server"
  value       = hcloud_server.this.status
}

output "placement_group_id" {
  description = "ID of the placement group, or null when the module creates none"
  value       = try(hcloud_placement_group.this[0].id, null)
}
