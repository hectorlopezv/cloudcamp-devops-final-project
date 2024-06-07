module "VPC" {
  source = "./modules/VPC"
  project_name = var.project_name
  vpc_cidr = var.vpc_cidr
  pub_sub1_cidr = var.pub_sub1_cidr
  pub_sub2_cidr = var.pub_sub2_cidr
  pri_sub3_cidr = var.pri_sub3_cidr
  pri_sub4_cidr = var.pri_sub4_cidr
  region = var.region
}

# nat gatweway for prive subnets and elastic ip
module "NAT-GTW"{
  source = "./modules/NAT"
  pub_sub1_id = module.VPC.PUB_SUB1_ID
  pri_sub3_id = module.VPC.PRI_SUB3_ID
  pri_sub4_id = module.VPC.PRI_SUB4_ID
  pub_sub2_id = module.VPC.PUB_SUB2_ID
  igw_id = module.VPC.IGW_ID
  vpc_id = module.VPC.IGW_ID
}

# security groups
module "IAM-SG"{
  source = "./modules/IAM-SG"
  vpc_id = module.VPC.VPC_ID
}

# EC2 instances
module "EC2_INSTANCES_APP_SERVER" {
  source = "./modules/EC2"
  availability_zone = "us-east-1"
  instance_type = "t2.micro"
}

#Adding the load balancer

module "LOAD_BALANCER_AND_TARGETS_AND_LISTENER" {
  source = "./modules/LB"
  vpc_id = module.VPC.VPC_ID
  pub_sub1_id = module.VPC.PUB_SUB1_ID
  pub_sub2_id = module.VPC.PUB_SUB2_ID
  app_server_1_id = module.EC2_INSTANCES_APP_SERVER.AWS_APP_SERVER_1_ID
  app_server_2_id = module.EC2_INSTANCES_APP_SERVER.AWS_APP_SERVER_2_ID
}