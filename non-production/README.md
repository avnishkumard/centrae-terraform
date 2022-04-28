## Terraform Production

# What is done
The resources have been moved into smaller folders.

Each folder has the similar structure.

```bash
network
├── main.tf
├── outputs.tf
├── terraform.tf
├── terraform.tfvars
└── variables.tf
```

### network/terraform.tfvars
Houses all the variables

### network/variables.tf
Houses all the variable definitions

### network/outputs.tf 
This file is important, and needs to include necessary outputs required 
for other modules.
For example the `vpc_id` here, it will be needed for other modules hence it's
necessary to declare this in the files.
```hcl
# VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

# Subnets

output "private_subnets" {
value = module.vpc.private_subnets
description = "Private subnet"
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}
# NAT gateways
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_public_ips
}

output "public_route_table_ids" {
  value = module.vpc.public_route_table_ids
  description = "List of IDs of public route tables"
}
output "private_route_table_ids" {
  value = module.vpc.private_route_table_ids
  description = "List of IDs of private route tables"
}
```
### network/main.tf
This does the actual Declaration of the terraform files.

### network/terraform.tf
Declares the backend.
```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.4.0"
    }
  }
  backend "s3" {
    key               = "network/terraform.tfstate"
    bucket            = "centrae-tf-prod"
    encrypt           = true
    profile           = "signiance-centrae"
    region            = "us-west-2"
    dynamodb_endpoint = "dynamodb.us-west-2.amazonaws.com"
    dynamodb_table    = "centrae-tf-state"

  }
}

provider "aws" {
  region = "us-west-2"

  profile = "signiance-centrae"
}
```

To use the outputs in another module the following needs to be done.

```hcl
# This Accesses the data from the network outputs.tf files
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "centrae-tf-prod"
    key    = "network/terraform.tfstate"
    region = "us-west-2"
  }
}
```

The rest of the file is as usual, notice how here the bucket `key` is different.
This is crucial or you will end up tainting the state file.
```hcl
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
}
```

To make it easier to reference the variables in your files you can also use 
the following.
```hcl
locals {

  vpc_id  = data.terraform_remote_state.network.outputs.vpc_id
  subnets = data.terraform_remote_state.network.outputs.public_subnets

}
```

## Migration overview.

### What was done.

The Terraform code has been split into separate services thus reducing the 
blast radius if anything goes down.

*Important things to read before trying to migrate*
* The modules itself use resources so you can import them to the 
 resource
 ```hcl
 terraform import module.vpc.resource.this[0] remote_resource
 ```
    This needs to be exactly the same how the module would see it
* The modules do not use the same thing as a resource to generate the AWS 
resources so make sure you add it properly.
Do not try to make changes to the state manually.
