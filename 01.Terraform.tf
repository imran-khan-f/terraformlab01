# Terraform Block
terraform {
  required_version = "~>1.11.4" # Terraform version on your system
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.17.0" # AWS hashicorp version
    }
  }
}

# Provider Block
provider "aws" {
  #region  = "us-west-1" # Region where i want the installation to be.
  region  = var.region-01
  #profile = "default" # access key and secret key profile name is "default"
}

/*
# 2nd provider block
provider "aws" {
  region = "us-west-2"
  profile = "default"
  alias = "aws-us-west-2"
}
*/