region = "us-east-1"
instance_type = "t2.micro"
instance_name = "terraform-instance"
instance_az = "us-east-1a"
tfstate_bucket_name = "cloudcamp-remote-tf-state-final-project"
tfstate_bucket_key = "backend/backend.tfstate"
dynamodb_table_name = "dynamo-db-tf-state-cloudcamp-final-project"
project_name = "todo-app"
vpc_cidr        = "10.0.0.0/16"
pub_sub1_cidr   = "10.0.1.0/24"
pub_sub2_cidr   = "10.0.2.0/24"
pri_sub3_cidr   = "10.0.3.0/24"
pri_sub4_cidr   = "10.0.4.0/24"