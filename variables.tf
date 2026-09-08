#-----------------------------------------------------------------------------------------------------------------------
# Variables
#-----------------------------------------------------------------------------------------------------------------------
variable "name" {
  default     = ""
  type        = string
  description = "Server hostname"
}

variable "placement_group_create" {
  default     = false
  type        = bool
  description = "Whether to create a spread placement group for the server"
}

variable "placement_group_name" {
  default     = ""
  type        = string
  description = "Create placement group with a given name"
}

variable "image" {
  description = "OS snapshot ID to be used. Default is empty, an initial snapshot will be created"
  type        = string
  default     = ""
}

variable "server_type" {
  default     = "cx22"
  type        = string
  description = "Name of the server type this server should be created with"
}

variable "location" {
  default     = ""
  type        = string
  description = "The location name to create the server in"
}

variable "ssh_keys" {
  default     = []
  type        = set(string)
  description = "SSH key IDs or names which should be injected into the server at creation time"
}

variable "firewall_ids" {
  default     = []
  type        = set(string)
  description = "Firewall IDs the server should be attached to on creation."
}

variable "backups" {
  default     = false
  type        = bool
  description = "Whether backups are enabled"
}

variable "keep_disk" {
  default     = false
  type        = bool
  description = "If true, do not upgrade the disk. This allows downgrading the server type later."
}

variable "protection" {
  default     = false
  type        = bool
  description = "Enable Hetzner delete and rebuild protection on the server."
}

variable "network_id" {
  default     = null
  type        = string
  description = "Network ID to spin up server in"
}

variable "public_ipv6_enabled" {
  default     = false
  type        = bool
  description = "Enable public IPv6 on the server"
}

variable "public_ipv4_enabled" {
  default     = false
  type        = bool
  description = "Enable public IPv4 on the server"
}

variable "primary_ipv4_id" {
  default     = null
  type        = number
  description = "ID of an existing primary IPv4 to attach. Null lets Hetzner assign one at creation"
}

variable "server_subnet" {
  default     = null
  type        = string
  description = "The subnet of the server"
}

variable "labels" {
  default     = {}
  type        = map(string)
  description = "A map of labels to add to all resources"
}
