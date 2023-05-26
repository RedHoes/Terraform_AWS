terraform {
  backend "s3" {
    bucket = "trainee-s3-devops"
    key    = "s3/terraform.tfstate"
    region = "ap-southeast-1"
  }
}