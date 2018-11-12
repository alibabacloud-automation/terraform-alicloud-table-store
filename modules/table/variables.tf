variable "instance_name" {
  description = "The name of the OTS instance in which table will located."
}

variable "table_name" {
  description = "The table name of the OTS instance. If changed, a new table would be created."
}

variable "primary_key" {
  description = "The property of TableMeta which indicates the structure information of a table. It describes the attribute value of primary key. The number of primary_key should not be less than one and not be more than four."
  type        = "list"
}

variable "time_to_live" {
  description = "The retention time of data stored in this table (unit: second). The value maximum is 2147483647 and -1 means never expired."
}

variable "max_version" {
  description = "The maximum number of versions stored in this table. The valid value is 1-2147483647."
}
