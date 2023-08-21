terraform {
  backend "s3" {
    bucket = "demo-eks"
    key    = "lab1/terraform.tfstate"
    region = "ap-southeast-1"
  }
}
