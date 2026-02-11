provider "alicloud" {
  region = "cn-zhangjiakou"
}
data "alicloud_zones" "default" {
}

module "vpc" {
  source  = "alibaba/vpc/alicloud"
  version = "v1.11.0"

  create             = true
  vpc_cidr           = "172.16.0.0/16"
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_zones.default.zones[0].id]
}

#alicloud_ots_instance
module "ots_instance" {
  source = "../../"

  # Table Store Instance
  create_instance = true

  instance_name = "tf-ots-new"
  description   = "tf-ots-instance-description"
  accessed_by   = "Any"
  instance_type = "HighPerformance"

  tags = var.tags

  # Table Store Instance Attachment
  bind_vpc = false

  # Table Store Table
  create_table = false

}

#alicloud_ots_instance_attachment
module "ots_instance_attachment" {
  source = "../../"

  # Table Store Instance
  create_instance = false

  # Table Store Instance Attachment
  bind_vpc = true

  use_existing_instance      = true
  vpc_name                   = "default"
  vswitch_id                 = module.vpc.this_vswitch_ids[0]
  existing_ots_instance_name = module.ots_instance.this_instance_name

  # Table Store Table
  create_table = false

}

#alicloud_ots_table
module "ots_table" {
  source = "../../"

  # Table Store Instance
  create_instance = false

  # Table Store Instance Attachment
  bind_vpc = false

  # Table Store Table
  create_table = true

  use_existing_instance      = true
  existing_ots_instance_name = module.ots_instance.this_instance_name
  table_name                 = "tf_ots_table_new"
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
  time_to_live = var.time_to_live
  max_version  = var.max_version

}