terraform {
  backend "s3" {
    bucket = "trainee-s3-devops"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
  }
}



