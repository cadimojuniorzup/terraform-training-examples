provider "aws" {
  version = ">= 2.28.1"
  profile = "zup-charles-training" 
  region = "sa-east-1"
}

terraform {
   required_version = ">= 0.12.0"
   backend "s3" {
    bucket = "charles-training-terraform"
    region = "sa-east-1"
    key = "terraform.tfstate"
    profile = "zup-charles-training"
  }
}

provider "local" {
  version = "~> 1.2"
}

provider "null" {
  version = "~> 2.1"
}

provider "template" {
  version = "~> 2.1"
}
