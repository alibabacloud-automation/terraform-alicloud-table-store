########
# Table Store Instance
########
module "tf_ots_instance" {
  source = "../modules/ots_instance"

  instance_name = "tf-instance2"
  description   = "tf-ots-instance"
  accessed_by   = "Any"
  instance_type = "HighPerformance"

  tags = {
    Created = "TF"
    For     = "Building table"
  }
}

######
# Table Store Instance Attachment
######
module "tf_ots_instance_attachment" {
  source = "../modules/ots_instance_attachment"

  instance_name = "${module.tf_ots_instance.name}"
  vpc_name      = "otsvpc"
  vswitch_id    = "vrt-bp193xqwtkrqipale6qz3"
}

######
# Table Store Table
######
module "tf_ots_table" {
  source = "../modules/ots_table"

  instance_name = "${module.tf_ots_instance.name}"
  table_name    = "tf_table"

  primary_key = [
    {
      name = "pk1"
      type = "Integer"
    },
    {
      name = "pk2"
      type = "Integer"
    },
    {
      name = "pk3"
      type = "Binary"
    },
    {
      name = "pk4"
      type = "String"
    },
  ]

  time_to_live = -1
  max_version  = 1
}
