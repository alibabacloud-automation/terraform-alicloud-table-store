Alicloud Table Store Terraform Module  
terraform-alicloud-table-store
=============================================

Terraform module which creates Table Store resources on Alibaba Cloud.

These types of resources are supported:

* [alicloud_ots_instance](https://www.terraform.io/docs/providers/alicloud/r/ots_instance.html)
* [alicloud_ots_instance_attachment](https://www.terraform.io/docs/providers/alicloud/r/ots_instance_attachment.html)
* [alicloud_ots_table](https://www.terraform.io/docs/providers/alicloud/r/ots_table.html)

Root module calls these modules which can also be used separately to create independent resources:

* [alicloud_ots_instance](https://github.com/terraform-alicloud-modules/terraform-alicloud-table-store/tree/master/modules/ots_instance) - Manage a Table Store Instance. 
* [alicloud_ots_instance_attachment](https://github.com/terraform-alicloud-modules/terraform-alicloud-table-store/tree/master/modules/ots_instance_attachment) - Bind a VPC to an OTS instance.
* [alicloud_ots_table](https://github.com/terraform-alicloud-modules/terraform-alicloud-table-store/tree/master/modules/ots_table) - Provide an OTS table resource.

----------------------

Usage
-----
You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. main.tf


    ```
    module "tf-ots" {
        source   = "terraform-alicloud-modules/table-store/alicloud"
    
        instance_name = "tf-ots"
        description = "tf-ots-instance"
        vpc_name = "tf-ots-vpc"
        vswitch_id = "vrt-bp1rvpm84ntm6g4bqwdvj"
        table_name = "tf-ots-table"
        primary_key = [
            {
              name = "${var.primary_key_1_name}"
              type = "${var.primary_key_integer_type}"
            },
            {
              name = "${var.primary_key_2_name}"
              type = "${var.primary_key_integer_type}"
            },
            {
              name = "${var.primary_key_3_name}"
              type = "${var.primary_key_binary_type}"
            },
            {
              name = "${var.primary_key_4_name}"
              type = "${var.primary_key_string_type}"
            },
        ]
        time_to_live = -1
        max_version = 1
    }
    ```

2. Setting values for the following variables through environment variables:

    - ALICLOUD_ACCESS_KEY
    - ALICLOUD_SECRET_KEY
    - ALICLOUD_REGION

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| instance_name | (ForcedNew)The name of the instance. | string | - | yes |
| accessed_by | The network limitation of accessing instance. Valid values:["Any", "Vpc", "ConsoleOrVpc"]. | string | "Any" | no | 
| instance_type |  The type of instance. Valid values: ["Capacity", "HighPerformance"]. | string | "HighPerformance" | no |
| description | The description of the instance. | string | - | yes |
| tags |  A mapping of tags to assign to the instance. | dict | {} | no |
| vswitch_id | The ID of attaching VSwitch to instance. | string | - | yes |
| vpc_name | The name of attaching VPC to instance. | string | - | yes |
| table_name |  The table name of the OTS instance. If changed, a new table would be created. | string | - | yes |
| primary_key | The property of TableMeta which indicates the structure information of a table. It describes the attribute value of primary key. The number of primary_key should not be less than one and not be more than four. | list | - | yes |
| time_to_live |  The retention time of data stored in this table (unit: second). The value maximum is 2147483647 and -1 means never expired. | long | - | yes |
| max_version | The maximum number of versions stored in this table. The valid value is 1-2147483647. | long | -  | yes | 


## Outputs

| Name | Description |
|------|-------------|
| this_instance_id | The ID of the Instance. |
| this_instance_name | The name of the Instance. |
| this_vpc_vswitch_id | The ID of attaching VSwitch to instance. |
| this_vpc_name | The name of attaching VPC to instance. |
| this_table_id | The ID of the Table. The value is <instance_name>:<table_name>. |
| this_table_name | The name of the Table. |


Authors
-------
Created and maintained by okingniko(@ZhuoranWang, okingniko@gmail.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
