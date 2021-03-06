data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "~> 1.11"
}

locals {
  cluster_name = var.cluster_name
}

module "eks" {
  source                          = "terraform-aws-modules/eks/aws"
  cluster_name                    = local.cluster_name
  subnets                         = var.subnets
  cluster_endpoint_private_access = true
  cluster_version                 = 1.17

  tags = {
    Environment = "prod"
  }

  vpc_id = var.vpc_id

  worker_groups = [
    {
      name                 = "worker-group-prod-1"
      instance_type        = "t3a.xlarge"
      asg_desired_capacity = 2
      asg_max_size         = 10
    },
  ]

}