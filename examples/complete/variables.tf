# table store instance variables
variable "tags" {
  description = "A mapping of tags to assign to the instance."
  type        = map(string)
  default = {
    Created = "tf"
  }
}

# table variables
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