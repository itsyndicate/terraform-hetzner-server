<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | ~> 1.49 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | 1.68.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [hcloud_placement_group.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/placement_group) | resource |
| [hcloud_server.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |
| [hcloud_network.network](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/data-sources/network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_backups"></a> [backups](#input\_backups) | Whether backups are enabled | `bool` | `false` | no |
| <a name="input_firewall_ids"></a> [firewall\_ids](#input\_firewall\_ids) | Firewall IDs the server should be attached to on creation. | `set(string)` | `[]` | no |
| <a name="input_image"></a> [image](#input\_image) | OS snapshot ID to be used. Default is empty, an initial snapshot will be created | `string` | `""` | no |
| <a name="input_keep_disk"></a> [keep\_disk](#input\_keep\_disk) | If true, do not upgrade the disk. This allows downgrading the server type later. | `bool` | `false` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | A map of labels to add to all resources | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | The location name to create the server in | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Server hostname | `string` | `""` | no |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | Network ID to spin up server in | `string` | `null` | no |
| <a name="input_placement_group_create"></a> [placement\_group\_create](#input\_placement\_group\_create) | Whether to create a spread placement group for the server | `bool` | `false` | no |
| <a name="input_placement_group_name"></a> [placement\_group\_name](#input\_placement\_group\_name) | Create placement group with a given name | `string` | `""` | no |
| <a name="input_primary_ipv4_id"></a> [primary\_ipv4\_id](#input\_primary\_ipv4\_id) | ID of an existing primary IPv4 to attach. Null lets Hetzner assign one at creation | `number` | `null` | no |
| <a name="input_protection"></a> [protection](#input\_protection) | Enable Hetzner delete and rebuild protection on the server. | `bool` | `false` | no |
| <a name="input_public_ipv4_enabled"></a> [public\_ipv4\_enabled](#input\_public\_ipv4\_enabled) | Enable public IPv4 on the server | `bool` | `false` | no |
| <a name="input_public_ipv6_enabled"></a> [public\_ipv6\_enabled](#input\_public\_ipv6\_enabled) | Enable public IPv6 on the server | `bool` | `false` | no |
| <a name="input_server_subnet"></a> [server\_subnet](#input\_server\_subnet) | The subnet of the server | `string` | `null` | no |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | Name of the server type this server should be created with | `string` | `"cx22"` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | SSH key IDs or names which should be injected into the server at creation time | `set(string)` | `[]` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_id"></a> [id](#output\_id) | ID of the Server resource |
| <a name="output_ipv4_address"></a> [ipv4\_address](#output\_ipv4\_address) | Public IPv4 address of the server |
| <a name="output_ipv6_address"></a> [ipv6\_address](#output\_ipv6\_address) | Public IPv6 address of the server |
| <a name="output_name"></a> [name](#output\_name) | Name of the Server resource |
| <a name="output_placement_group_id"></a> [placement\_group\_id](#output\_placement\_group\_id) | ID of the placement group, or null when the module creates none |
| <a name="output_status"></a> [status](#output\_status) | Status of the server |
<!-- END_TF_DOCS -->