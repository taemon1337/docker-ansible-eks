required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "~> 5.59.0"
  }
}

provider "aws" "main" {
  config {
    region = var.region

    assume_role_with_web_identity {
      role_arn           = var.role_arn
      web_identity_token = var.identity_token
    }

    default_tags {
      tags = var.default_tags
    }
  }
}