variable "vpc_name" {
  description = "The vpc name used to launch a new vpc."
  default     = "TF-VPC"
}

variable "vpc_description" {
  description = "The vpc description used to launch a new vpc."
  default     = "A new VPC created by Terrafrom"
}

variable "vpc_cidr" {
  description = "The cidr block used to launch a new vpc when 'vpc_id' is not specified."
  default     = "172.16.0.0/16"
}

# VSwitch variables
variable "vswitch_cidr" {
  description = "cidr blocks used to launch new vswitch."
  default     = "172.16.0.0/16"
}

variable "vswitch_name" {
  description = "The vswitch name prefix used to launch several new vswitch."
  default     = "TF_VSwitch"
}

variable "vswitch_description" {
  description = "The vswitch description used to launch several new vswitch."
  default     = "New VSwitch created by Terrafrom module tf-alicloud-vpc-cluster."
}

variable "instance_name" {
  description = "The name of the OTS instance."
}

variable "ots_vpc_name" {
  description = "The name of attaching VPC to instance."
}

