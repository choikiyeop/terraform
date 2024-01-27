terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.33.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.25.2"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }
  }

  # backend "s3" {
  #   bucket  = "cky-tfstate-bucket"
  #   key     = "terraform/terraform.tfstate"
  #   region  = "ap-northeast-2"
  #   encrypt = true
  #   # dynamodb_table = "terraform-tfstate-lock"
  # }
}

provider "aws" {
  region = "ap-northeast-2"
}
