# alicloud_ots_instance
This resource will help you to manager a Table Store Instance. It is foundation of creating data table.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| instance_name | The name of the instance. | string | - | yes |
| accessed_by | The network limitation of accessing instance. Valid values:["Any", "Vpc", "ConsoleOrVpc"]. | string | "Any" | no | 
| instance_type |  The type of instance. Valid values: ["Capacity", "HighPerformance"]. | string | "HighPerformance" | no |
| description | The description of the instance. | string | - | yes |
| tags |  A mapping of tags to assign to the instance. | dict | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The resource ID. The value is same as the "name". |
| name | The instance name. |
| description | The instance description. |
| accessed_by | The network limitation of accessing instance. |
| instance_type | The instance type. |
| tags | The instance tags. |

