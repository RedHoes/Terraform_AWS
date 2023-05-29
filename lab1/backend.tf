terraform {
  backend "s3" {
    bucket = "demo-eks"
    key    = "trainee/lab1/terraform.tfstate"
    region = "ap-southeast-1"
  }
}
