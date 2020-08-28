variable "region" {
  default = "sa-east-1"
  type = string
}

variable "cluster_name" {
  default = "eks-training"
  type = string
}

variable "subnets" {
  default = ["subnet-6149c428","subnet-7869e61e","subnet-7bd24720"]
  type = list(string)
}

variable "vpc_id" {
  default = "vpc-089d8f6f"
  type = string
}

