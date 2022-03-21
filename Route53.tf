module "zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "~> 2.0"

  zones = {
    "Centrae.com" = {
      comment = "Centrae.com"
      tags = {
        env = "production"
      }
    }

  }

  tags = {
    ManagedBy = "Terraform"
  }
}