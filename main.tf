######
# Table Store Instance
######
module "instance" {
  source = "./modules/instance"

  name          = "${var.name}"
  description   = "${var.description}"
  accessed_by   = "${var.accessed_by}"
  instance_type = "${var.instance_type}"
  tags          = "${var.tags}"
}

######
# Table Store Instance Attachment
######
module "instance_attachment" {
  source        = "./modules/instance_attachment"
  instance_name = "${var.instance_name}"
  vpc_name      = "${var.vpc_name}"
  vswitch_id    = "${var.vswitch_id}"
}

######
# Table Store Table
######
module "table" {
  source = "./modules/table"

  instance_name = "${var.instance_name}"
  table_name    = "${var.table_name}"
  primary_key   = "${var.primary_key}"
  time_to_live  = "${var.time_to_live}"
  max_version   = "${var.max_version}"
}
