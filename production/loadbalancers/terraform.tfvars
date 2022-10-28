alb-name       = "Production"
alb_cidr_block = "0.0.0.0/0"
env            = "Production"
bucket         = "alb-production-logs-centrae"
host_header_domain = "production.centrae.com"

tags = {
    Terraform = "true"
    "Business Unit" = "Centrae"
    Environment = "production"
    Created_By = "Leon"
}
