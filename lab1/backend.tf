terraform {
  backend "s3" {
    # bucket = "trainee-s3-devops"
    bucket = "nothingisfuckingimpossible"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
  }
}



