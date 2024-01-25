module "custom_vpc" {
  source = "./modules/vpc"

  vpc_name = "${var.name}-vpc"
  vpc_cidr = var.vpc_cidr

  azs = var.azs

  tags = var.tags
}

module "custom_eks" {
  source = "./modules/eks"

  cluster_name = "${var.name}-cluster"

  vpc_id = module.custom_vpc.vpc_id
  private_subnets_ids = module.custom_vpc.private_subnets
  intra_subnets_ids = module.custom_vpc.intra_subnets
  
  tags = var.tags
}

module "custom_iam" {
  source = "./modules/iam"

  oidc_provider_arn = module.custom_eks.eks_oidc_provider_arn
  
  tags = var.tags
}