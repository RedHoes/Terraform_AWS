data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "trainee-s3-devops"
    key    = "network/terraform.tfstate"
    region = "ap-southeast-1"
  }
}