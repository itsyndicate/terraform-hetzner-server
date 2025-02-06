<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | 1.49.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | 1.49.1 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_placement_group.this](https://registry.terraform.io/providers/hetznercloud/hcloud/1.49.1/docs/resources/placement_group) | resource |
| [hcloud_server.this](https://registry.terraform.io/providers/hetznercloud/hcloud/1.49.1/docs/resources/server) | resource |
| [random_string.server](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backups"></a> [backups](#input\_backups) | Whether backups are enabled | `bool` | `false` | no |
| <a name="input_datacenter"></a> [datacenter](#input\_datacenter) | The datacenter name to create the server in | `string` | `""` | no |
| <a name="input_firewall_ids"></a> [firewall\_ids](#input\_firewall\_ids) | Firewall IDs the server should be attached to on creation. | `set(string)` | `[]` | no |
| <a name="input_image"></a> [image](#input\_image) | OS snapshot ID to be used. Default is empty, an initial snapshot will be created | `string` | `""` | no |
| <a name="input_iso"></a> [iso](#input\_iso) | ID or Name of an ISO image to mount. | `string` | `""` | no |
| <a name="input_keep_disk"></a> [keep\_disk](#input\_keep\_disk) | If true, do not upgrade the disk. This allows downgrading the server type later. | `bool` | `false` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | A map of labels to add to all resources | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | The location name to create the server in | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Server hostname | `string` | `""` | no |
| <a name="input_placement_group_create"></a> [placement\_group\_create](#input\_placement\_group\_create) | ----------------------------------------------------------------------------------------------------------------------- Placement Group ----------------------------------------------------------------------------------------------------------------------- | `bool` | `false` | no |
| <a name="input_placement_group_name"></a> [placement\_group\_name](#input\_placement\_group\_name) | Create placement group with a given name | `string` | `""` | no |
| <a name="input_rescue"></a> [rescue](#input\_rescue) | Enable and boot in to the specified rescue system. This enables simple installation of custom operating systems. linux64 or linux32 | `string` | `""` | no |
| <a name="input_server_count"></a> [server\_count](#input\_server\_count) | Number of servers to provision in the pool | `number` | `null` | no |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | Name of the server type this server should be created with | `string` | `"cx22"` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | SSH key IDs or names which should be injected into the server at creation time | `set(string)` | `[]` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | Cloud-Init user data to use during server creation | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->