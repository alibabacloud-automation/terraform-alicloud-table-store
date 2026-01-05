output "this_instance_id" {
  description = "The id of the ots instance"
  value       = local.instance_name
}

output "this_instance_name" {
  description = "The name of the ots instance"
  value       = local.instance_name
}

output "this_vpc_name" {
  description = "The vpc name of the ots instance attached."
  value       = concat(alicloud_ots_instance_attachment.this[*].vpc_name, [""])[0]
}

output "this_vswitch_id" {
  description = "The vswitch id of the ots instance attached."
  value       = concat(alicloud_ots_instance_attachment.this[*].vswitch_id, [""])[0]
}

output "this_table_name" {
  description = "The name of the ots table"
  value       = concat(alicloud_ots_table.this[*].table_name, [""])[0]
}

