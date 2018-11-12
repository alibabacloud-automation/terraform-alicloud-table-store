// Zones data source for availability_zone
data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "vpc" {
  name = "${var.vpc_name}"
  cidr_block = "${var.vpc_cidr}"
  description = "${var.vpc_description}"
}

resource "alicloud_vswitch" "vswitches" {
  vpc_id = "${alicloud_vpc.vpc.id}"
  cidr_block = "${var.vswitch_cidr}"
  availability_zone = "${data.alicloud_zones.default.zones.0.id}"
  name = "${var.vswitch_name}"
  description = "${var.vswitch_description}"
}

resource "alicloud_ots_instance_attachment" "this" {
  instance_name = "${var.instance_name}"
  vpc_name = "${var.ots_vpc_name}"
  vswitch_id = "${alicloud_vswitch.vswitches.id}"
}