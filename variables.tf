

# table store instance variables
variable "create_instance" {
  description = "Whether to create ots instance. if true, a new ots instance will be created. It will be ignore if 'use_existing_instance = true'"
  type        = bool
  default     = true
}

variable "use_existing_instance" {
  description = "Whether to use existing ots instance."
  type        = bool
  default     = false
}

variable "existing_ots_instance_name" {
  description = "An existing ots instance name, if 'use_existing_instance = true', this field is required. "
  type        = string
  default     = ""
}

variable "instance_name" {
  description = "The name of the instance."
  type        = string
  default     = ""
}

variable "description" {
  description = "The description of the instance."
  type        = string
  default     = ""
}

variable "accessed_by" {
  description = "The network limitation of accessing instance. Valid values:[\"Any\", \"Vpc\", \"ConsoleOrVpc\"]."
  type        = string
  default     = "Any"
}

variable "instance_type" {
  description = "The type of instance. Valid values: [\"Capacity\", \"HighPerformance\"]."
  type        = string
  default     = "HighPerformance"
}

variable "tags" {
  description = "A mapping of tags to assign to the instance."
  type        = map(string)
  default     = {}
}

# table store instance attachment variables
variable "bind_vpc" {
  description = "Whether to create ots instance attachment. If true, the ots instance will be attached with vpc and vswitch."
  type        = bool
  default     = true
}

variable "vpc_name" {
  description = "The name of attaching VPC to instance."
  type        = string
  default     = ""
}

variable "vswitch_id" {
  description = "The ID of attaching VSwitch to instance."
  type        = string
  default     = ""
}

# table variables
variable "create_table" {
  description = "Whether to create ots table. If true, a new ots table will be created"
  type        = bool
  default     = true
}

variable "table_name" {
  description = "(Required, ForceNew) The table name of the OTS instance. If changed, a new table would be created."
  type        = string
  default     = ""
}

variable "primary_key" {
  description = "The property of TableMeta which indicates the structure information of a table. It describes the attribute value of primary key. The number of primary_key should not be less than one and not be more than four."
  type = list(object({
    name = string
    type = string
  }))
  default = []
}

variable "time_to_live" {
  description = "The retention time of data stored in this table (unit: second). The value maximum is 2147483647 and -1 means never expired."
  type        = number
  default     = -1
}

variable "max_version" {
  description = "The maximum number of versions stored in this table. The valid value is 1-2147483647."
  type        = number
  default     = 1
}