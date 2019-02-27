variable "instance_name" {
  description = "(Required, ForceNew) The name of the instance."
}

variable "description" {
  description = "(Required, ForceNew) The description of the instance."
  default     = "tf"
}

variable "accessed_by" {
  description = "The network limitation of accessing instance. Valid values:[\"Any\", \"Vpc\", \"ConsoleOrVpc\"]."
  default     = "Any"
}

variable "instance_type" {
  description = "(ForceNew) The type of instance. Valid values: [\"Capacity\", \"HighPerformance\"]."
  default     = "HighPerformance"
}

variable "tags" {
  description = "A mapping of tags to assign to the instance."
  type        = "map"
  default     = {}
}
