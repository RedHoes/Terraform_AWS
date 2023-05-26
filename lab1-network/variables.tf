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
