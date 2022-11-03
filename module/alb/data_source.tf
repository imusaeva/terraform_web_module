data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "aws-session-may2022-remote-backend"
    region = "us-east-1"
    key    = "web-module-dev/terraform.tfstate"
  }
}