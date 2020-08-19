provider "aws" {
  version = "~> 2.0" 
  profile = "zup-charles-training" 
  region = "us-east-1"
}

terraform {
   backend "s3" {
    bucket = "charles-training-terraform"
    region = "sa-east-1"
    key = "terraform.tfstate"
    profile = "zup-charles-training"
  }
}

data "aws_availability_zones" "available" {}
