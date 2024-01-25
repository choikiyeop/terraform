variable "cluster_name" {
  description = "클러스터의 이름"
  type = string
}

variable "vpc_id" {
  description = "vpc의 id"
}

variable "private_subnets_ids" {
  description = "subnet의 id들"
}

variable "intra_subnets_ids" {
  description = "control plane의 인트라 서브넷 id들"
}

variable "tags" {
  description = "클러스터의 태그"
}
