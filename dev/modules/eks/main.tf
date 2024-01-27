module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "19.21.0"

  cluster_name = var.cluster_name
  cluster_version = "1.29"
  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id = var.vpc_id
  subnet_ids = var.private_subnets_ids
  control_plane_subnet_ids = var.intra_subnets_ids

  eks_managed_node_group_defaults = {
    instance_types = ["t3.small", "t3.medium"]
  }

  eks_managed_node_groups = {
    # blue = {}
    green = {
      min_size = 1
      max_size = 3
      desired_size = 2

      instance_types = ["t3.small"]
      capacity_type = "SPOT"
    }
  }

  tags = var.tags
}

resource "helm_release" "aws_load_balancer_controller_release" {
  name       = "aws-load-balancer-controller"
  chart      = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  namespace  = "kube-system"

  set {
    name = "clusterName"
    value = module.eks.cluster_name
  }
  
  set {
    name = "serviceAccount.create"
    value = "true"
  }
  
  set {
    name = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }
  
  set {
    name = "region"
    value = "ap-norteast-2"
  }
  
  set {
    name = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = var.lb_controller_role_arn
  }
}