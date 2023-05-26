terraform {
  backend "s3" {
    bucket = "trainee-s3-devops"
    key    = "network/terraform.tfstate"
    region = "ap-southeast-1"
  }
}
