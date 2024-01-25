output "vpc_id" {
  description = "vpc id"
  value = module.vpc.vpc_id
}

output "private_subnets" {
  description = "private_subnets"
  value = module.vpc.private_subnets
}

output "intra_subnets" {
  description = "intra_subnets"
  value = module.vpc.intra_subnets
}