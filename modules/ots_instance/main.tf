resource "alicloud_ots_instance" "this" {
  name          = "${var.instance_name}"
  description   = "${var.description}"
  accessed_by   = "${var.accessed_by}"
  instance_type = "${var.instance_type}"
  tags          = "${var.tags}"
}
