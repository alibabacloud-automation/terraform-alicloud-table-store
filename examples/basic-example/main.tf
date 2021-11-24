variable "profile" {
  default = "default"
}

variable "region" {
  default = "cn-hangzhou"
}
variable "name" {
  default = "terraform_test_003"
}

variable "zone_id" {
  default = "cn-hangzhou-h"
}

provider "alicloud" {
  region  = var.region
  profile = var.profile
}

data "alicloud_vpcs" "default" {
  is_default = true
}

resource "alicloud_vpc" "default" {
  count = length(data.alicloud_vpcs.default.ids) > 0 ? 0 : 1
  vpc_name = var.name
  cidr_block = "172.16.0.0/12"
}

data "alicloud_vswitches" "default" {
  is_default = true
  zone_id    = var.zone_id
}

// If there is no default vswitch, create one.
resource "alicloud_vswitch" "default" {
  count             = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  availability_zone = var.zone_id
  vpc_id            = data.alicloud_vpcs.default.ids.0
  cidr_block        = cidrsubnet(data.alicloud_vpcs.default.vpcs.0.cidr_block, 4, 15)
}

module "ots" {
  source        = "../../"
  region        = var.region
  profile       = var.profile
  instance_name = "tf-ots-instance"
  description   = "tf-ots-instance"
  accessed_by   = "Any"
  instance_type = "HighPerformance"
  tags = {
    Created = "TF"
    For     = "Building table"
  }
  vpc_name   = "default"
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids.0 : concat(alicloud_vswitch.default.*.id, [""])[0]
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