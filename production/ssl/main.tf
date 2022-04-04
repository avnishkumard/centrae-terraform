 provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}
resource "aws_acm_certificate" "centrae_com" {
  provider= aws.us-east-1
  domain_name               = var.domain_name
  validation_method         = var.validation_method
  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    {
      Name = "Centrea.com"
    }
  )
}


