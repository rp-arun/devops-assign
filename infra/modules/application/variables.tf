variable "private_subnet_ids" {
  type = list(string)	
}

variable "target_group_arn" {
  type = string
}

variable "sg_ec2_id" {
  type = string
}