# alicound_table
Provides an OTS table resource.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| instance_name | The name of the OTS instance. | string | - | yes |
| table_name |  The table name of the OTS instance. If changed, a new table would be created. | string | - | yes |
| primary_key | The property of TableMeta which indicates the structure information of a table. It describes the attribute value of primary key. The number of primary_key should not be less than one and not be more than four. | list | - | yes |
| time_to_live |  The retention time of data stored in this table (unit: second). The value maximum is 2147483647 and -1 means never expired. | long | - | yes |
| max_version | The maximum number of versions stored in this table. The valid value is 1-2147483647. | long | -  | yes |

## Outputs

| Name | Description |
|------|-------------|
| this_instance_id | The resource ID. The value is <instance_name>:<table_name>. |
| this_instance_name | The OTS instance name. |
| this_table_name | The table name of the OTS which could not be changed. |
| this_primary_key | The property of TableMeta which indicates the structure information of a table. |
| this_time_to_live | The retention time of data stored in this table. |
| this_max_version | The maximum number of versions stored in this table. | 
