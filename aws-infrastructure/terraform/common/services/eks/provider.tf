provider "aws" {
  region  = var.region
  profile = var.aws_profile_name
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

terraform {
  backend "s3" {
    bucket = var.state_bucket
    key    = "eks"
    region = var.region
    profile = var.aws_profile_name
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.27.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }
  }
  required_version = "~> 1.7.0"
}
