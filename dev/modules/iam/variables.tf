variable "oidc_provider_arn" {
  description = "eks의 oidc provider arn"
}

variable "tags" {
  description = "iam의 태그"
}

variable "hosted_zone_arns" {
  description = "호스트 존의 arn들"
  type = list(string)
}
