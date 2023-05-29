resource "aws_key_pair" "long-key-pair" {
  key_name   = "Lab1 KeyGen"
  public_key = file("./files/lab1.pub")
}

resource "aws_security_group" "lab1_security_group" {
  name        = "SecurityGroupEC2"
  description = "Security group for EC2 instances"
  vpc_id      = var.vpc_id
  # Allow port 22,80,443 for inbound traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = var.tcp
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = var.tcp
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = var.tcp
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ebs_volume" "lab1_volumes" {
  count             = length(var.instance_names)
  availability_zone = element(var.availability_zone, count.index)
  size              = var.aws_ebs_volume_size

  tags = {
    Name = "ebs-volume-${count.index + 1}"
  }
}

resource "aws_instance" "lab1_ec2_instances" {
  count                     = length(var.instance_names)
  availability_zone         = element(var.availability_zone, count.index)
  instance_type             = var.instance_type

  # subnet_id               = local.public_subnets[count.index]
  subnet_id                 = var.subnet_id[count.index]
  ami                       = var.ami
  vpc_security_group_ids    = [aws_security_group.lab1_security_group.id]
  key_name                  = aws_key_pair.long-key-pair.id

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y 
    sudo apt install -y nginx
    sudo service nginx start
  EOF

  tags = {
    Name = element(var.instance_names, count.index)
  }
}

resource "aws_volume_attachment" "ebs_attachment" {
  count       = length(var.instance_names)
  device_name = var.device_name
  volume_id   = aws_ebs_volume.lab1_volumes[count.index].id
  instance_id = aws_instance.lab1_ec2_instances[count.index].id
}
