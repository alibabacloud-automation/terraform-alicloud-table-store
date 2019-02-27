# alicloud_ots_instance_attachment
This resource will help you to bind a VPC to an OTS instance.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| instance_name | The name of the OTS instance. | string | - | yes |
| vpc_name | The name of attaching VPC to instance. | string | - | yes |
| vswitch_id | The ID of attaching VSwitch to instance. | string | - | yes | 


## Outputs

| Name | Description |
|------|-------------|
| id | The resource ID. The value is same as "instance_name". |
| instance_name | The instance name. |
| vpc_name | The name of attaching VPC to instance. |
| vswitch_id | The ID of attaching VSwitch to instance. |

