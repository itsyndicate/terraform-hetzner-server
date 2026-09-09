#-----------------------------------------------------------------------------------------------------------------------
# Outputs
#-----------------------------------------------------------------------------------------------------------------------
output "id" {
  description = "ID of the Server resource"
  value       = module.server.id
}

output "name" {
  description = "Name of the Server resource"
  value       = module.server.name
}

output "ipv4_address" {
  description = "Public IPv4 address of the server"
  value       = module.server.ipv4_address
}

output "status" {
  description = "Status of the server"
  value       = module.server.status
}

output "placement_group_id" {
  description = "ID of the placement group"
  value       = module.server.placement_group_id
}
