terraform {
  required_version = ">= 1.3.0 "
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"

    }
  }
  backend "s3" {
    bucket = "terra-projects-backend"
    key = "terraform.tfstate"
    region = "eu-central-1"
    use_lockfile = true 
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = var.common_tags
  }
}