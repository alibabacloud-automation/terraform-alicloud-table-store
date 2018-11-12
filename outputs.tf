output "this_instance_id" {
  value = "${module.instance.this_instance_id}"
}

output "this_instance_name" {
  value = "${module.instance.this_instance_name}"
}

output "this_vpc_name" {
  value = "${module.instance_attachment.this_vpc_name}"
}

output "this_vswitch_id" {
  value = "${module.instance_attachment.this_vswitch_id}"
}

output "this_table_id" {
  value = "${module.table.this_table_id}"
}

output "this_table_name" {
  value = "${module.table.this_table_name}"
}
