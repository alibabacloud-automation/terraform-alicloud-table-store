########
# Table Store Instance
########
module "tf_ots_instance" {
  source = "../modules/ots_instance"

  instance_name = "tf-instance"
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

  vpc_name            = "tf-vpc"
  vpc_cidr            = "172.16.0.0/16"
  vpc_description     = "tf-vpc-descrition"
  vswitch_name        = "tf-vswitch"
  vswitch_cidr        = "172.16.0.0/16"
  vswitch_description = "tf-vswitch-description"

  instance_name = "${module.tf_ots_instance.name}"
  ots_vpc_name  = "otsvpc"
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
