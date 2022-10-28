alb-name       = "Non-Production"
alb_cidr_block = "0.0.0.0/0"

tags= {
env            = "staging"
Terraform = true
}
bucket         = "non-prod-alb-logs-centrae"
host_header_domain = "assessments.centrae.com"

alb-log-prefix = "non-prod-alb"
alb-name-sg="non-prod-alb"

default-tg="default-tg"
