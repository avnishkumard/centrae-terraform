# Cantrae Docs

## Getting Started

The terraform uses S3 backend, this is configured in `provider.tf`
```
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.4.0"
    }
  }
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
```
For more info visit the [docs](https://www.terraform.io/language/settings/backends/s3)

To init the backend to
```bash
terraform init
```

If you're using gitlab state and you now want to migrate do
```bash
terraform init -migrate-state
```


## Overview of resources(WIP)
