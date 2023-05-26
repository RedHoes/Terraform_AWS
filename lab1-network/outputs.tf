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
