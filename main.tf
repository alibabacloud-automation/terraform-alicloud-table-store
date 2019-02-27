######
# Table Store Instance
######
module "ots_instance" {
  source = "./modules/ots_instance"

  instance_name = "${var.instance_name}"
  description   = "${var.description}"
  accessed_by   = "${var.accessed_by}"
  instance_type = "${var.instance_type}"
  tags          = "${var.tags}"
}

######
# Table Store Instance Attachment
######
module "ots_instance_attachment" {
  source        = "./modules/ots_instance_attachment"
  instance_name = "${module.ots_instance.name}"
  vpc_name      = "${var.vpc_name}"
  vswitch_id    = "${var.vswitch_id}"
}

######
# Table Store Table
######
module "ots_table" {
  source = "./modules/ots_table"

  instance_name = "${module.ots_instance.name}"
  table_name    = "${var.table_name}"
  primary_key   = "${var.primary_key}"
  time_to_live  = "${var.time_to_live}"
  max_version   = "${var.max_version}"
}
