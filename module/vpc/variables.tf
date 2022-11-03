variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnet" {
  type    = list(string)
  default = ["public_subnet_1", "public_subnet_2", "public_subnet_3"]
}
variable "private_subnet_cidr" {
  type    = list(string)
  default = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]

}

variable "cidr_block" {
  type    = string
  default = "0.0.0.0/0"
}

variable "private_subnet" {
  type    = list(string)
  default = ["private_subnet_1", "private_subnet_2", "private_subnet_3"]
}

variable "public_rt" {
  type    = string
  default = "public_rt"
}

variable "private_rt" {
  type    = string
  default = "private_rt"
}

variable "az" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "env" {
  type    = string
  default = "dev"
}

variable "project" {
  type    = string
  default = "akumoSolutions"
}

variable "team" {
  type    = string
  default = "DevOps"
}

variable "owner" {
  type    = string
  default = "Irina"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "stage" {
  type    = string
  default = "nonprod"
}