locals {
  name = "aws-${var.env}-${var.project}-rtype"
  common_tags = {
    env     = var.env
    region  = var.region
    project = var.project
  }
}