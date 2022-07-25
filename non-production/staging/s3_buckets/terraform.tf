terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.4.0"
    }
  }
  backend "s3" {
    key               = "s3_bucket/terraform.tfstate"
    bucket            = "centrae-tf-staging"
    encrypt           = true
    profile           = "signiance-centrae"
    region            = "us-west-2"
    dynamodb_endpoint = "dynamodb.us-west-2.amazonaws.com"
    dynamodb_table    = "centrae-tf-staging"

  }
  # backend "s3" {
  #  key               = "network/terraform.tfstate"
  #  bucket="centrae-tf-non-prod"
  #  encrypt           = true
  #  profile           = "signiance-default"
  #  region            = "us-west-2"
  #  dynamodb_endpoint = "dynamodb.us-west-2.amazonaws.com"
  #  dynamodb_table    = "signiance-test"

  #}
}

#provider "aws" {
#  region  = "us-west-2"
#
#  profile = "signiance-centrae"
#}

provider "aws" {
  region = "us-west-2"

  profile = "signiance-centrae"
}