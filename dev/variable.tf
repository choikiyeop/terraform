variable "name" {
  description = "클러스터 이름"
  type        = string
  default     = "cky"
}

variable "vpc_cidr" {
  description = "vpc의 cidr"
  type        = string
  default     = "10.0.0.0/16"
}

variable "tags" {
  description = "태그"
  type = object({
    Cluster = string
  })
  default = {
    Cluster = "cky"
  }
}
