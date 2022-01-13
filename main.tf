locals {
  instance_name = var.use_existing_instance ? var.existing_ots_instance_name : concat(alicloud_ots_instance.this.*.name, [""])[0]
}

# Table Store Instance
resource "alicloud_ots_instance" "this" {
  count = var.create_instance ? 1 : 0

  name          = var.instance_name
  description   = var.description
  accessed_by   = var.accessed_by
  instance_type = var.instance_type
  tags          = var.tags
}

# Table Store Instance Attachment
resource "alicloud_ots_instance_attachment" "this" {
  count = var.bind_vpc ? 1 : 0

  vpc_name      = var.vpc_name
  vswitch_id    = var.vswitch_id
  instance_name = local.instance_name
}

# Table Store Table
resource "alicloud_ots_table" "this" {
  count = var.create_table ? 1 : 0

  instance_name = local.instance_name
  table_name    = var.table_name
  dynamic "primary_key" {
    for_each = var.primary_key
    content {
      name = primary_key.value.name
      type = primary_key.value.type
    }
  }
  time_to_live = var.time_to_live
  max_version  = var.max_version
}