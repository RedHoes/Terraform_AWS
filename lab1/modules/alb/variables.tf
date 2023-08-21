variable "region" {
  type = string
}

variable "load_balancer_type" {
  type = string
}

variable "load_balancer_name" {
  type = string
}

variable "zone_id" {
  type    = string
  default = "Z193E5Z0IWYOLY"
}

variable "name" {
  type    = string
  default = "example.com"
}

variable "type" {
  type = string
}

variable "ttl" {
  type    = number
  default = 300
}

variable "HTTP" {
  type = string
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
  type = list(string)
}
