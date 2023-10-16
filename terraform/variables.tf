#####################################################
# VPC Requirement
#####################################################

variable "notbad_vpc" {
  description = "VPC for notbad take home task"
  type        = string
  default     = "10.0.0.0/16"
}

#####################################################
# EC2 Requirement
#####################################################

variable "instance_tenancy" {
  description = "it defines the tenancy of VPC. Whether it's default or dedicated"
  type        = string
  default     = "default"
}

variable "ami_id" {
  description = "ami id"
  type        = string
  default     = "ami-0989fb15ce71ba39e"
}

variable "instance_type" {
  description = "Instance type to create an instance"
  type        = string
  default     = "t3.small"
}

variable "ssh_private_key" {
  description = "pem file of Keypair we used to login to EC2 instances"
  type        = string
  default     = "~/.ssh/id_ed25519"
}