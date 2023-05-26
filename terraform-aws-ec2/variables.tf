variable "region"{
    type = string
    default = "ap-southeast-1"
}

variable "availability_zone"{
    type = list(string)
    default = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "aws_security_group" {
  description = "ID or name of the AWS Security Group"
  type        = string
  default     = "lab1_SC"
}

variable instance_type {
    type = string
    default = "t2.micro"
}

variable "aws_ebs_volume_size" {
    type = number
    default = "8"
}

variable "key_name"{
    type = string
    default = "Lab1 KeyGen"
}

variable "ami" {
  type    = string
  default = "ami-0df7a207adb9748c7"  
}

variable "instance_names" {
  type    = list(string)
  default = ["trainee-instance-1", "trainee-instance-2"]
}

variable "device_name"{
    description = "ebs device name"
    default = "/dev/sdf"  
}

variable "cidr_blocks_public"{
    type = string
    description = "cidr block"
    default = "10.0.1.0/24"
}

variable "tcp" {
    type = string
    default = "tcp"
}