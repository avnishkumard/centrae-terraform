data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "centrae-tf-prod"
    key    = "network/terraform.tfstate"
    region = "us-west-2"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.4.0"
    }
  }
  backend "s3" {
    key               = "alb/terraform.tfstate"
    bucket            = "centrae-tf-prod"
    encrypt           = true
    profile           = "signiance-centrae"
    region            = "us-west-2"
    dynamodb_endpoint = "dynamodb.us-west-2.amazonaws.com"
    dynamodb_table    = "centrae-tf-state"

  }
  # backend "s3" {
  #  key               = "network/terraform.tfstate"
  #  bucket            = "signiance-tf-prod"
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
#  profile = "signiance-default"
#}

provider "aws" {
  region = "us-west-2"

  profile = "signiance-centrae"
}