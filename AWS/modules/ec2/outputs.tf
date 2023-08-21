output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.lab1_ec2_instances.*.id
}

output "security_group_id" {
  description = "security group of EC2 instance"
  value       = aws_instance.lab1_ec2_instances.*.security_groups
}

output "public_ip" {
  value = aws_instance.lab1_ec2_instances.*.public_ip
}
