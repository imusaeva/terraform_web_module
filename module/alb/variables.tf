variable "env" {
  type        = string
  description = " This is a variable for environment "
  default     = "dev"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "stage" {
  type    = string
  default = "nonprod"
}

variable "project" {
  type    = string
  default = "akumoSolutions"
}

variable "app_port" {
  type    = number
  default = 80
}

variable "ports" {
  type    = list(string)
  default = ["80", "443", "22"]
}

variable "egress_port" {
  type    = number
  default = 0
}

variable "egress_protocol" {
  type    = number
  default = "-1"
}

variable "sg_cidr" {
  type    = string
  default = "0.0.0.0/0"
}
variable "vpc_id" {
  type        = string
  description = "VPC id "
  default     = "vpc-0c4569fbcc26de722"
}

variable "subnets_id" {
  type        = list(string)
  description = "List of subnets"
  default     = ["subnet-0bf5b6432e3afcd74", "subnet-0fb70b14c8e4a4737"]
}