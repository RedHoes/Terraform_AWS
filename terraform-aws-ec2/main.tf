module "ec2_instance" {
  source  = "./modules/ec2_instance"

  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  ami                    = var.ami
  aws_security_group     = var.aws_security_group
  instance_names         = var.instance_names
  device_name            = var.device_name
  aws_ebs_volume_size    = var.aws_ebs_volume_size
}
