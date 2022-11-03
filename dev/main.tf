module "vpc" {
  source              = "/home/ec2-user/terraform_web_module/module/vpc"
  env                 = "dev"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnet       = ["public_subnet_1", "public_subnet_2", "public_subnet_3"]
  private_subnet_cidr = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
  cidr_block          = "0.0.0.0/0"
  private_subnet      = ["private_subnet_1", "private_subnet_2", "private_subnet_3"]
  public_rt           = "public_rt"
  private_rt          = "private_rt"
  az                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
  project             = "akumoSolutions"
  team                = "DevOps"
  owner               = "Irina"
  region              = "us-east-1"
  stage               = "nonprod"
}

##### root module for ALB #####
module "alb" {
  source          = "/home/ec2-user/terraform_web_module/module/alb"
  env             = "dev"
  vpc_id          = module.vpc.vpc_id
  subnets_id      = module.vpc.subnet_id
  region          = "us-east-1"
  stage           = "nonprod"
  project         = "akumoSolutions"
  app_port        = "80"
  ports           = ["80", "443", "22"]
  egress_port     = "0"
  egress_protocol = "-1"
  sg_cidr         = "0.0.0.0/0"
}

######## Root module for ASG ###########
module "asg" {
  source              = "/home/ec2-user/terraform_web_module/module/asg"
  env                 = "dev"
  max_size            = "5"
  min_size            = "2"
  desired_capacity    = "2"
  force_delete        = "true"
  instance_type       = "t2.micro"
  project             = "akumoSolutions"
  web_ports           = ["80", "443", "22"]
  vpc_id = module.vpc.vpc_id
  vpc_zone_identifier = module.vpc.subnet_id
  lb_target_group_arn = module.alb.target_group_arn
}