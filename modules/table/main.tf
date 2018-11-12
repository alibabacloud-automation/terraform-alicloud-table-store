resource "alicloud_ots_table" "this" {
  instance_name = "${var.instance_name}"
  table_name    = "${var.table_name}"
  primary_key   = "${var.primary_key}"
  time_to_live  = "${var.time_to_live}"
  max_version   = "${var.max_version}"
}
