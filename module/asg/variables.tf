variable "max_size" {
  type        = number
  description = "Variable for maximum size of EC2 instances for my ASG"
  default     = 5
}
variable "min_size" {
  type        = number
  description = "Variable for minimum size of EC2"
  default     = 2
}
variable "desired_capacity" {
  type        = number
  description = "Variable for desired capacity"
  default     = 2
}
variable "force_delete" {
  type        = bool
  description = "This is th force delete option"
  default     = true
}
variable "instance_type" {
  type        = string
  description = "Variable for EC2 type"
  default     = "t2.micro"
}
variable "env" {
  type    = string
  default = "dev"
}
variable "project" {
  type    = string
  default = "akumoSolutions"
}
variable "web_ports" {
  type = list(string)
  default = ["80" , "443", "22"]
}
variable "vpc_zone_identifier" {
  type        = list(string)
  description = "a list of subnets"
  default     = [ "subnet-0bf5b6432e3afcd74", "subnet-0fb70b14c8e4a4737" ]
}

variable "vpc_id" {
  type        = string
  description = "this is a variable of custom vpc "
  default     = "vpc-0c4569fbcc26de722"
}

variable "lb_target_group_arn" {
  type        = string
  description = "this is a variable for arn of target group"
  default     = "test"
}