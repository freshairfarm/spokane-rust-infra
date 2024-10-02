terraform {
  required_version = ">=1.9.3"

  backend "s3" {
    bucket         = "s3-spokanerust-tf-state"
    region         = "us-west-2"
    acl            = "bucket-owner-full-control"
    dynamodb_table = "dt-spokanerust-tf-state-lock"
    key            = "terraform/dev.tfstate"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.66.0"
    }
  }
}

provider "aws" {
  allowed_account_ids = [local.account_id]
  region              = "us-west-2"
}
