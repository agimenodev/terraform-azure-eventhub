## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| azurerm | ~>2.41 |

## Providers

| Name | Version |
|------|---------|
| azurerm | ~>2.41 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auto\_inflate\_enabled | Enabled auto-inflate in order to ajutomatically scale up throughput when necessary | `bool` | `false` | no |
| capacity | The capacity of the event hub namespace (1 - 20) | `number` | `20` | no |
| eventhub\_name | The name of the eventhub | `string` | n/a | yes |
| eventhubs | The eventhub configuration | <pre>map(object({<br>    partition_count   = number<br>    message_retention = number<br>  }))</pre> | n/a | yes |
| location | The location where the PostgreSQL DB should be created | `string` | n/a | yes |
| log\_analytics\_workspace\_id | The id of the log analytics workspace | `string` | n/a | yes |
| maximum\_throughput\_units | Specifies the maximum number of throughput units when auto-inflate is enabled | `number` | `5` | no |
| resource\_group\_name | The name of the resource group the database should be deployed in | `string` | n/a | yes |
| tags | Tags to add to resources | `map(string)` | `{}` | no |
| vnet\_rule\_subnet\_id | The id of the subnet from which the eventhub can be accessed | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| namespace\_name | The name of the eventhub namespace |
| primary\_connection\_string | The primary connection string |

