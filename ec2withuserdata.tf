# creating instance
resource "aws_instance" "terraforminstance" {
  ami                         = "ami-052f483c20fa1351a"
  availability_zone           = "ap-southeast-1b"
  instance_type               = "t2.micro"
  count                       = 1
  security_groups             = ["sg-06ccf644a0617cddd"]
  subnet_id                   = "subnet-1a786253"
  user_data                   = file("createwebsite.sh")
  associate_public_ip_address = true
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = 8
    volume_type           = "gp2"
    delete_on_termination = true
    tags = {
      Name = "terraform-storage"
    }
  }
  tags = var.tags
}