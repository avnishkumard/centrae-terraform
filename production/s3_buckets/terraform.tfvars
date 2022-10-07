bucket_name = "frontend-prod-centrae"

domain_name = "*.centrae.com"

seagage_domain_name = "*.seagage.com"

aliases_name = "prod-frontend.centrae.com"

seagage_aliases_name = "*.seagage.com"

tags = {
    Terraform = "true"
    "Business Unit" = "Centrae"
    Environment = "Production"
    Created_By = "Leon"
}


backend_api="prod-api.centrae.com"

backend_lb_url="production-1288100872.us-west-2.elb.amazonaws.com"