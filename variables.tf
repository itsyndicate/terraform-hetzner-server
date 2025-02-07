#-----------------------------------------------------------------------------------------------------------------------
# Variables
#-----------------------------------------------------------------------------------------------------------------------
variable "name" {
  default     = ""
  type        = string
  description = "Server hostname"
}

variable "placement_group_create" {
  default = false
  type    = bool
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

variable "datacenter" {
  default     = ""
  type        = string
  description = "The datacenter name to create the server in"
}

variable "user_data" {
  default     = ""
  type        = string
  description = "Cloud-Init user data to use during server creation"
}

variable "ssh_keys" {
  default = []
  type = set(string)
  description = "SSH key IDs or names which should be injected into the server at creation time"
}

variable "firewall_ids" {
  default = []
  type = set(string)
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

variable "iso" {
  default     = ""
  type        = string
  description = "ID or Name of an ISO image to mount."
}

variable "rescue" {
  default     = ""
  type        = string
  description = "Enable and boot in to the specified rescue system. This enables simple installation of custom operating systems. linux64 or linux32"
}

variable "server_count" {
  default     = null
  type        = number
  description = "Number of servers to provision in the pool"
}

variable "network_id" {
  default     = null
  type        = string
  description = "Network ID to spin up server in"
}

variable "labels" {
  default = {}
  type = map(string)
  description = "A map of labels to add to all resources"
}
