output "id" {
  value = "${alicloud_ots_table.this.instance_name}:${alicloud_ots_table.this.table_name}"
}

output "instance_name" {
  value = "${alicloud_ots_table.this.instance_name}"
}

output "table_name" {
  value = "${alicloud_ots_table.this.table_name}"
}

output "primary_key" {
  value = "${alicloud_ots_table.this.primary_key}"
}

output "time_to_live" {
  value = "${alicloud_ots_table.this.time_to_live}"
}

output "max_version" {
  value = "${alicloud_ots_table.this.max_version}"
}
