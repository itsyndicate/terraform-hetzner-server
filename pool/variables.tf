variable "defaults" {
  description = "Map of default values which will be used for each item."
  type        = any
  default = {}
}

variable "server_pools" {
  default = {}
  type = map(object({
    server_count = number

    name        = string
    server_type = string
    image       = string
    location = optional(string)
    datacenter = optional(string)
    user_data = optional(string)
    ssh_keys = optional(set(string))
    keep_disk = optional(bool)
    iso = optional(string)
    rescue = optional(string)
    labels = optional(map(string))
    firewall_ids = optional(set(string))
    network_id = optional(string)
    placement_group_create= optional(bool)
    placement_group_name = optional(string)
    backups = optional(bool)

  }))
  description = "A map of server pool settings"
}
