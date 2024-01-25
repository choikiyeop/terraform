variable "vpc_name" {
  description = "vpc의 이름"
  type = string
}

variable "vpc_cidr" {
  description = "vpc의 cidr"
}

variable "azs" {
  description = "vpc의 가용존"
  type = list(string)
}

variable "tags" {
  description = "vpc의 태그"
}
