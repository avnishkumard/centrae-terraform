# This defines the backend for Terraform
# The Docs show how to set this up
# https://www.terraform.io/language/settings/backends/s3

#TODO import S3 bucket

resource "aws_s3_bucket" "tf-backend-s3" {
  bucket         = "centrae-tf-backend"
  hosted_zone_id = "Z3BJ6K6RIION7M"
  tags           = {}
  tags_all       = {}
}

resource "aws_dynamodb_table" "tf-backend-dynamodb" {
  name         = "centrae-tf-state"
  billing_mode = "PROVISIONED"

  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  stream_enabled = false
  table_class    = "STANDARD"
  tags = {
    "Name" = "tf-state-lock"
  }
  tags_all = {
    "Name" = "tf-state-lock"
  }

  point_in_time_recovery {
    enabled = false
  }

  timeouts {}

  ttl {
    attribute_name = ""
    enabled        = false
  }


  lifecycle {
    ignore_changes = [read_capacity, write_capacity]
  }

}
