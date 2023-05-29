output "vpc_id" {
  value       = module.network.vpc_id
}

output "public_subnets" {
#   value       = ["${aws_subnet.public_subnet.*.id}"]
  value = module.network.public_subnets
}

output "private_subnets" {
#   value       = ["${aws_subnet.private_subnet.*.id}"]
  value = module.network.private_subnets
}

output "public_route_table" {
  value = module.network.public_route_table
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.ec2_instance.instance_id
}

output "security_group_id" {
  description = "security group of EC2 instance"
  value       = module.ec2_instance.security_group_id
}

output "public_ip" {
  value       = module.ec2_instance.public_ip
}