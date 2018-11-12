########
# Table Store Instance
########
module "instance" {
  source = "../modules/instance"

  name          = "tf-ots-instance"
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
module "instance_attachment" {
  source = "../modules/instance_attachment"

  instance_name = "tf-ots-instance"
  vpc_name      = "otsvpc"
  vswitch_id    = "vsw-bp1iq9sdhhjnd5y79rxhd"
}

######
# Table Store Table
######
module "table" {
  source = "../modules/table"

  instance_name = "tf-ots-instance"
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
