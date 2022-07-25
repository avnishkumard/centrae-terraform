terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.4.0"
    }
  }
  backend "s3" {
    key               = "ecr/centrae-assessments-be/terraform.tfstate"
    bucket            = "centrae-tf-staging"
    encrypt           = true
    profile           = "signiance-centrae"
    region            = "us-west-2"
    dynamodb_endpoint = "dynamodb.us-west-2.amazonaws.com"
    dynamodb_table    = "centrae-tf-staging"
  }
}

provider "aws" {
  region = "us-west-2"

  profile = "signiance-centrae"
}
