output "eks_oidc_provider_arn" {
  description = "eks의 oidc provier arn"
  value = module.eks.oidc_provider_arn
}