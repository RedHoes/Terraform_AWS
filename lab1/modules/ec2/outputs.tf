output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.lab1_ec2_instances.*.id
}

output "security_group_id" {
  description = "security group of EC2 instance"
  value       = aws_instance.lab1_ec2_instances.*.security_groups
}

# output "instance_public_ip" {
#   description = "Public IP address of the EC2 instances"
#   value       = aws_instance.lab1_ec2_instances.public_ip
# }