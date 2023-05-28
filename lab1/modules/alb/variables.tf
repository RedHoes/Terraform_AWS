variable "region"{
  type = string
  default = "ap-southeast-1"
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

variable "vpc_id" {
  type = string
}

variable "public_subnet" {
  type = list(string)
}

variable "private_subnet" {
  type = list(string)
}

variable "security_groups" {
  type = string
}

variable "instance_id" {
  type = string
}

variable "target_id" {
  type = string
}

variable "target_groups" {
  type = list(string)
}