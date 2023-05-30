variable "availability_zone" {
  description = "Availability Zone"
  type        = list(string)
}

variable "aws_security_group" {
  type        = string
  description = "security group for ec2"
}

variable "instance_type" {
  description = "Type of instance"
  type        = string
}

variable "aws_ebs_volume_size" {
  type        = string
  description = "EBS volume size"
  default     = 8
}

variable "instance_names" {
  description = "List of instance names"
  type        = list(string)
}

variable "ami" {
  type        = string
  description = "AMI ID"
}

variable "device_name" {
  type        = string
  description = "ebs device name"
}

variable "tcp" {
  type    = string
  default = "tcp"
}

variable "subnet_id" {
  type        = list(string)
  description = "public subnet for ec2 instances"
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "iam_instance_profile" {
  type = string
}