provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "example_instance" {
  ami           = "ami-052f483c20fa1351a"
  instance_type = "t2.micro"

  tags = {
    Name        = "hoanguyen"
    Environment = "Production"
  }
}
