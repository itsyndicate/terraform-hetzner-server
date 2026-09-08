#-----------------------------------------------------------------------------------------------------------------------
# Variables
#-----------------------------------------------------------------------------------------------------------------------
variable "name" {
  description = "Server hostname"
  type        = string
  default     = ""
}

variable "placement_group_create" {
  description = "Whether to create a spread placement group for the server"
  type        = bool
  default     = false
}

variable "placement_group_name" {
  description = "Create placement group with a given name"
  type        = string
  default     = ""
}

variable "image" {
  description = "OS snapshot ID to be used. Default is empty, an initial snapshot will be created"
  type        = string
  default     = ""
}

variable "server_type" {
  description = "Name of the server type this server should be created with"
  type        = string
  default     = "cx22"
}

variable "location" {
  description = "The location name to create the server in"
  type        = string
  default     = ""
}

variable "ssh_keys" {
  description = "SSH key IDs or names which should be injected into the server at creation time"
  type        = set(string)
  default     = []
}

variable "firewall_ids" {
  description = "Firewall IDs the server should be attached to on creation."
  type        = set(string)
  default     = []
}

variable "backups" {
  description = "Whether backups are enabled"
  type        = bool
  default     = false
}

variable "keep_disk" {
  description = "If true, do not upgrade the disk. This allows downgrading the server type later."
  type        = bool
  default     = false
}

variable "protection" {
  description = "Enable Hetzner delete and rebuild protection on the server."
  type        = bool
  default     = false
}

variable "network_id" {
  description = "Network ID to spin up server in"
  type        = string
  default     = null
}

variable "public_ipv6_enabled" {
  description = "Enable public IPv6 on the server"
  type        = bool
  default     = false
}

variable "public_ipv4_enabled" {
  description = "Enable public IPv4 on the server"
  type        = bool
  default     = false
}

variable "primary_ipv4_id" {
  description = "ID of an existing primary IPv4 to attach. Null lets Hetzner assign one at creation"
  type        = number
  default     = null
}

variable "server_subnet" {
  description = "The subnet of the server"
  type        = string
  default     = null
}

variable "labels" {
  description = "A map of labels to add to all resources"
  type        = map(string)
  default     = {}
}
