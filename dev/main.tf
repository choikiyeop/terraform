# module "custom_s3" {
#   source = "./modules/s3"
# }

module "custom_route53" {
  source = "./modules/route53"

  zones = {
    "example.com" = {
      comment = "example.com (production)"
      tags = {
        env = "production"
      }
    }
  }
}

module "custom_vpc" {
  source = "./modules/vpc"

  vpc_name = "${var.name}-vpc"
  vpc_cidr = var.vpc_cidr

  azs = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = var.tags
}

module "custom_eks" {
  source = "./modules/eks"

  cluster_name = "${var.name}-cluster"

  vpc_id              = module.custom_vpc.vpc_id
  private_subnets_ids = module.custom_vpc.private_subnets
  intra_subnets_ids   = module.custom_vpc.intra_subnets

  lb_controller_role_arn = module.custom_iam.lb_controller_irsa_role

  tags = var.tags
}

module "custom_iam" {
  source = "./modules/iam"

  oidc_provider_arn = module.custom_eks.eks_oidc_provider_arn

  hosted_zone_arns = [module.custom_route53.route53_zone_zone_arn["example.com"]]

  tags = var.tags
}