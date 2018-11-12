# table store instance variables
variable "name" {
  description = "The name of the instance."
}

variable "description" {
  description = "The description of the instance."
}

variable "accessed_by" {
  description = "The network limitation of accessing instance. Valid values:[\"Any\", \"Vpc\", \"ConsoleOrVpc\"]."
  default     = "Any"
}

variable "instance_type" {
  description = "The type of instance. Valid values: [\"Capacity\", \"HighPerformance\"]."
  default     = "HighPerformance"
}

variable "tags" {
  description = "A mapping of tags to assign to the instance."
}

variable "instance_name" {
  description = "The name of the OTS instance."
}

variable "vswitch_id" {
  description = "The ID of attaching VSwitch to instance."
}

variable "vpc_name" {
  description = "The name of attaching VPC to instance."
}

variable "table_name" {
  description = "(Required, ForceNew) The table name of the OTS instance. If changed, a new table would be created."
}

variable "primary_key" {
  description = "The property of TableMeta which indicates the structure information of a table. It describes the attribute value of primary key. The number of primary_key should not be less than one and not be more than four."
  type        = "list"
}

variable "primary_key_1_name" {
  description = "Name for primary key."
}

variable "primary_key_2_name" {
  description = "Name for primary key."
}

variable "primary_key_3_name" {
  description = "Name for primary key."
}

variable "primary_key_4_name" {
  description = "Name for primary key."
}

variable "primary_key_integer_type" {
  description = "Integer type for primary key."
}

variable "primary_key_string_type" {
  description = "String type for primary key."
}

variable "primary_key_binary_type" {
  description = "Binary type for primary key."
}

variable "time_to_live" {
  description = "The retention time of data stored in this table (unit: second). The value maximum is 2147483647 and -1 means never expired."
}

variable "max_version" {
  description = "The maximum number of versions stored in this table. The valid value is 1-2147483647."
}
