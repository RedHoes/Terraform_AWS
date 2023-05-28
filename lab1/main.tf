module "network" {
  source = "./modules/network"

  vpc_name             = var.vpc_name
  environment          = var.environment
  region               = var.region
  availability_zones   = var.availability_zones
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr

}

module "ec2_instance" {
  source  = "./modules/ec2"

  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  ami                    = var.ami
  aws_security_group     = var.aws_security_group
  instance_names         = var.instance_names
  device_name            = var.device_name
  aws_ebs_volume_size    = var.aws_ebs_volume_size
  subnet_id              = module.network.public_subnets
  vpc_id                 = module.network.vpc_id
}

module "alb" {
  source  = "./modules/alb" 
  name = var.load_balancer_name
  load_balancer_type = var.load_balancer_type
  vpc_id             = module.network.vpc_id
  public_subnet      = module.network.public_subnets
  security_groups    = var.aws_security_group_alb
  private_subnet     = module.network.private_subnets 
  instance_id        = module.ec2_instance.instance_id
}

module "s3" {
  source = "./modules/s3"
  bucket-name = "bucket-trainee-nfq"
}