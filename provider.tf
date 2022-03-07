terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.4.0"
    }
  }
  backend "http" {
  }
}

provider "aws" {
  region  = "us-west-2"
  profile = "signiance-centrae"
}
