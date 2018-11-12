output "this_instance_id" {
  value = "${alicloud_ots_instance_attachment.this.instance_name}"
}

output "this_instance_name" {
  value = "${alicloud_ots_instance_attachment.this.instance_name}"
}

output "this_vpc_name" {
  value = "${alicloud_ots_instance_attachment.this.vpc_name}"
}

output "this_vswitch_id" {
  value = "${alicloud_ots_instance_attachment.this.vswitch_id}"
}
