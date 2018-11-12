# Complete Table Store Example

Configuration in this directory creates set of Table Store resources including instance, instance attachment(bind vpc), table. 

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Outputs

| Name | Description |
|------|-------------|
| this_instance_id | The ID of the Instance. |
| this_instance_name | The name of the Instance. |
| this_vpc_id | The ID of attaching VPC to instance. |
| this_vpc_vswitch_id | The ID of attaching VSwitch to instance. |
| this_vpc_name | The name of attaching VPC to instance. |
| this_table_id | The ID of the Table. The value is <instance_name>:<table_name>. |
| this_table_name | The name of the Table. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
