terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.4.0"
    }
  }
  #backend "http" {
  #}
  backend "s3" {
    key = "tf-state"
    bucket = "centrae-tf-backend"
    region = "us-west-2"
    profile = "signiance-centrae"
    dynamodb_endpoint = "dynamodb.us-west-2.amazonaws.com"
    dynamodb_table = "centrae-tf-state"

    }
}

provider "aws" {
  region  = "us-west-2"
  profile = "signiance-centrae"
}
