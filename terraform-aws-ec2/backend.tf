terraform {
  backend "s3" {
    bucket = "trainee-s3-devops"
    key    = "ec2/terraform.tfstate"
    region = "ap-southeast-1"
  }
}


