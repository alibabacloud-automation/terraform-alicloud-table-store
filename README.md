# Alicloud Table Store Terraform Module 

Terraform module which creates Table Store resources on Alibaba Cloud.

These types of resources are supported:

* [instance](https://github.com/terraform-providers/terraform-provider-alicloud/blob/master/website/docs/r/ots_instance.html.markdown)
* [instance_attachment](https://github.com/terraform-providers/terraform-provider-alicloud/blob/master/website/docs/r/ots_instance_attachment.html.markdown)
* [table](https://github.com/terraform-providers/terraform-provider-alicloud/blob/master/website/docs/r/ots_table.html.markdown)

----------------------

Usage
-----
You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. main.tf

    ```
    module "instance" {
      source = "terraform-alicloud-modules/table-store/alicloud"
    
      name          = "tf-ots-instance"
      description   = "tf-ots-instance"
      accessed_by   = "Any"
      instance_type = "HighPerformance"
    
      tags = {
        Created = "TF"
        For     = "Building table"
      }
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
| this_vswitch_id | The ID of attaching VSwitch to instance. |
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
