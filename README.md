Alibaba Cloud Table Store (OTS) Terraform Module
terraform-alicloud-table-store
=====================================================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-table-store/blob/master/README-CN.md)

Terraform module which creates slb http resources on Alibaba Cloud.

These types of resources are supported:

* [OTS Instance](https://github.com/terraform-providers/terraform-provider-alicloud/blob/master/website/docs/r/ots_instance.html.markdown)
* [OTS Instance_Attachment](https://github.com/terraform-providers/terraform-provider-alicloud/blob/master/website/docs/r/ots_instance_attachment.html.markdown)
* [OTS Table](https://github.com/terraform-providers/terraform-provider-alicloud/blob/master/website/docs/r/ots_table.html.markdown)

## Usage

```hcl
module "ots" {
  source  = "terraform-alicloud-modules/table-store/alicloud"
  instance_name = "tf-ots-instance"
  description   = "tf-ots-instance"
  accessed_by   = "Any"
  instance_type = "HighPerformance"
  tags = {
    Created = "TF"
    For     = "Building table"
  }
  vpc_name   = "default"
  vswitch_id = "vsw-1q214xxxx"
  table_name = "tf_ots_table"
  primary_key = [
    {
      name = "pk1"
      type = "Integer"
    },
    {
      name = "pk2"
      type = "Integer"
    },
    {
      name = "pk3"
      type = "Binary"
    },
    {
      name = "pk4"
      type = "String"
    },
  ]
  time_to_live = -1
  max_version  = 1
}

```

----------------------
## Notes
From the version v1.2.0, the module has removed the following `provider` setting:

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/table-store"
}
```

If you still want to use the `provider` setting to apply this module, you can specify a supported version, like 1.1.0:

```hcl
module "ots" {
  source = "terraform-alicloud-modules/table-store/alicloud"

  version     = "1.1.0"
  region      = "cn-hangzhou"
  profile     = "Your-Profile-Name"

  instance_name = "tf-ots-instance"
  // ...
}
```

If you want to upgrade the module to 1.2.0 or higher in-place, you can define a provider which same region with
previous region:

```hcl
provider "alicloud" {
   region  = "cn-hangzhou"
   profile = "Your-Profile-Name"
}
module "ots" {
  source = "terraform-alicloud-modules/table-store/alicloud"
  instance_name = "tf-ots-instance"
  // ...
}
```
or specify an alias provider with a defined region to the module using `providers`:

```hcl
provider "alicloud" {
  region  = "cn-hangzhou"
  profile = "Your-Profile-Name"
  alias   = "hz"
}
module "ots" {
  source = "terraform-alicloud-modules/table-store/alicloud"

  providers = {
    alicloud = alicloud.hz
  }
  
  instance_name = "tf-ots-instance"
  // ...
}
```

and then run `terraform apply` to make the defined provider effect to the existing module state.

More details see [How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

----------------------
## Examples

* [Basic example](https://github.com/terraform-alicloud-modules/terraform-alicloud-table-store/tree/master/examples/basic-example)

----------------------
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.56.0 |

----------------------

Submit Issues
-------------
If you have any problems when using this module, please opening a [provider issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by okingniko(@ZhuoranWang, okingniko@gmail.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
