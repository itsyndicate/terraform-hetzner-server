#-----------------------------------------------------------------------------------------------------------------------
# Outputs
#-----------------------------------------------------------------------------------------------------------------------
output "id" {
  description = "ID of the Server resource"
  value       = module.server.id
}

output "ipv4_address" {
  description = "Public IPv4 address of the server"
  value       = module.server.ipv4_address
}
