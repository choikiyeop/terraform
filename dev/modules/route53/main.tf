module "zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "2.11.0"

  zones = var.zones

  tags = {
    ManagedBy = "Terraform"
  }
}