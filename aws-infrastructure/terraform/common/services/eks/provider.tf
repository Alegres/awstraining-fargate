provider "aws" {
  region  = var.region
  profile = var.aws_profile_name
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }
  }
  required_version = "~> 1.7.0"
}
