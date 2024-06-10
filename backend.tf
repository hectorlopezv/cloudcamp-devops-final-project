terraform {
  backend "s3" {
    bucket         = "cloudcamp-remote-tf-state-final-project"
    key            = "backend/backend.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dynamo-db-tf-state-cloudcamp-final-project"
  }
}