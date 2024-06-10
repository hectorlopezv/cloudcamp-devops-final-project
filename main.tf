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
#Efs file system for private subnets
module "EFS" {
  source             = "./modules/efs"
  vpc_id             = module.VPC.VPC_ID
  private_subnet_ids = [module.VPC.PRI_SUB3_ID, module.VPC.PRI_SUB4_ID]
  efs_security_group_id = module.IAM-SG.efs_security_group_id
  efs_sg_id = module.IAM-SG.efs_security_group_id
}

# EC2 instances
module "EC2_INSTANCES_APP_SERVER" {
  source = "./modules/EC2"
  availability_zone = "us-east-1"
  instance_type = "t2.micro"
  efs_id = module.EFS.efs_id
  subnet_id_1 = module.VPC.PRI_SUB3_ID
  subnet_id_2 = module.VPC.PRI_SUB4_ID
  ec2_sg_id = module.IAM-SG.ec2_security_group_id
  bastion_ami_id = module.IAM-SG.bastion_security_group_id
  bastion_instance_type = "t2.micro"
  bastion_key_name = "bastion-key"
  public_subnet_id = module.VPC.PUB_SUB1_ID
  bastion_sg_id = module.IAM-SG.bastion_security_group_id

}

#Adding the load balancer

module "LOAD_BALANCER_AND_TARGETS_AND_LISTENER" {
  source = "./modules/LB"
  vpc_id = module.VPC.VPC_ID
  pub_sub1_id = module.VPC.PUB_SUB1_ID
  pub_sub2_id = module.VPC.PUB_SUB2_ID
  app_server_1_id = module.EC2_INSTANCES_APP_SERVER.AWS_APP_SERVER_1_ID
  app_server_2_id = module.EC2_INSTANCES_APP_SERVER.AWS_APP_SERVER_2_ID
  lb_sg_id = module.IAM-SG.lb_sg_id
}


#RDS DB Mysql
module "RDS_MYSQL_DB"{
  source = "./modules/RDS"
  db_user          = "db-user"
db_password      = "db-password"
db_name          = "db-database"
db_port         = "3306"
vpc_id           = module.VPC.VPC_ID
subnet_ids       = [module.VPC.PRI_SUB3_ID, module.VPC.PRI_SUB4_ID]
ec2_sg_id        = module.IAM-SG.ec2_security_group_id
rds_sg_id = module.IAM-SG.rds_security_group_id
}

