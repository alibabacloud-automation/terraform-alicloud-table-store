output "this_table_id" {
  value = "${alicloud_ots_table.this.instance_name}:${alicloud_ots_table.this.table_name}"
}

output "this_instance_name" {
  value = "${alicloud_ots_table.this.instance_name}"
}

output "this_table_name" {
  value = "${alicloud_ots_table.this.table_name}"
}

output "this_primary_key" {
  value = "${alicloud_ots_table.this.primary_key}"
}

output "this_time_to_live" {
  value = "${alicloud_ots_table.this.time_to_live}"
}

output "this_max_version" {
  value = "${alicloud_ots_table.this.max_version}"
}
