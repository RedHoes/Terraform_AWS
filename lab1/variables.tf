variable "environment" {
  description = "Deployment Environment"
  default           = "trainee"
}

variable "vpc_name" {
  description = "Name of the VPC"
default = "trainee-vpc"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default               = "10.100.0.0/16"
}

variable "public_subnets_cidr" {
  description = "CIDR block for public subnet"
  type        = list
  default    = ["10.100.10.0/24", "10.100.20.0/24"] 
}


variable "private_subnets_cidr" {
  description = "CIDR block for private subnet"
  type        = list
  default  = ["10.100.1.0/24", "10.100.2.0/24"] 
}

variable "availability_zones" {
  type        = list
  description = "Available zones where resources will be deployed"
  default     = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "availability_zone"{
    type = list(string)
    default = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "aws_security_group" {
  description = "ID or name of the AWS Security Group"
  type        = string
  default     = "SecurityGroupEC2"
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

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
  default     = "vpc-0ce0e196fc95fb8ea"
}

variable "load_balancer_type" {
  type = string
  default = "application"
}

variable "load_balancer_name" {
  type = string
  default = "trainee-alb"
}

variable "zone_id" {
  type = string
  default = "Z193E5Z0IWYOLY" 
}

variable "name" {
  type = string
  default = "trainee.devops.nfq.asia"
}

variable "type" {
  type = string
  default = "CNAME"
}

variable "ttl" {
  type = number
  default = 300
}

variable "HTTP" {
  type = string
  default = "HTTP"
}

variable "aws_security_group_alb" {
  description = "ID or name of the AWS ALB Security Group"
  type        = string
  default     = "SecurityGroupALB"
}

# variable "instance_id" {
#   type = string 
#   description = "instance id"
# }

# variable "vpc_id" {
#   type = string
#   default = "value"
# }

# variable "public_subnet" {
#   type = string
#   default = "value"
# }

# variable "private_subnet" {
#   type = string
#   default = "value"
# }