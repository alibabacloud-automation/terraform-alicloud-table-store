output "id" {
  value = "${alicloud_ots_instance_attachment.this.instance_name}"
}

output "instance_name" {
  value = "${alicloud_ots_instance_attachment.this.instance_name}"
}

output "vpc_name" {
  value = "${alicloud_ots_instance_attachment.this.vpc_name}"
}

output "vswitch_id" {
  value = "${alicloud_ots_instance_attachment.this.vswitch_id}"
}
