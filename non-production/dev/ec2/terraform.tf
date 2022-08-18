data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket  = "centrae-tf-non-prod"
    key     = "network/terraform.tfstate"
    region  = "us-west-2"
    profile = "signiance-centrae"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.23.0"
    }
  }
  backend "s3" {
    key               = "ec2/terraform.tfstate"
    bucket            = "centrae-tf-non-prod"
    encrypt           = true
    profile           = "signiance-centrae"
    region            = "us-west-2"
    dynamodb_endpoint = "dynamodb.us-west-2.amazonaws.com"
    dynamodb_table    = "centrae-tf-non-prod"

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

provider "aws" {
  region = "us-west-2"

  profile = "signiance-centrae"
}
