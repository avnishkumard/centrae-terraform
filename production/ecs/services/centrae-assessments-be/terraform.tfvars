task_cpu       = 256
task_mem       = 512
family         = "centrae-assesments-be-prod"
log_group_name = "/ecs/assessments-be-prod"

cd_cpu  = 256
cd_mem  = 512
cd_name = "centrae-assessments-be-prod"

ecs_cluster_key = "Production"
cd_portMappings = [{
  containerPort = 80
  hostPort      = 80
}]

ecs_service_name = "centrae-assessments-be-prod"

lb_container_name = "centrae-assessments-be-prod"
lb_container_port = "80"
tags = {
    Terraform = "true"
    "Business Unit" = "Centrae"
    Environment = "production"
    Created_By = "Leon"
}

awslogs-region = "us-west-2"
sec_group_name = "assesments-be-prod"

host_header_domain = "prod-api.centrae.com"
domain_name = "*.centrae.com"
lb_name = "Production"
listener_arn = ""

env_vars = [
  {
    name      = "DB_HOST",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:DB_HOST::"
    },
    {
    name      = "DB_PASSWORD",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:DB_PASSWORD::"
    },
    {
    name      = "DB_USER",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:DB_USER::"
    },
    {
    name      = "API_HOST",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:API_HOST::"
    },
    {
    name      = "JWT_TOKEN",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:JWT_TOKEN::"
    },
    {
    name      = "DEBUG",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:DEBUG::"
    },
    {
    name      = "APP_NAME",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:APP_NAME::"
    },
    {
    name      = "APP_ENV",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:APP_ENV::"
    },
    {
    name      = "APP_KEY",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:APP_KEY::"
    },
    {
    name      = "APP_DEBUG",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:APP_DEBUG::"
    },
    {
    name      = "APP_URL",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:APP_URL::"
    },
    {
    name      = "API_PORT",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:API_PORT::"
    },
    {
    name      = "LOG_CHANNEL",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:LOG_CHANNEL::"
    },
    {
    name      = "SESSION_LIFETIME",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:SESSION_LIFETIME::"
    },
    {
    name      = "MAIL_HOST",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:MAIL_HOST::"
    },
    {
    name      = "MAIL_USERNAME",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:MAIL_USERNAME::"
    },
    {
    name      = "MAIL_PASSWORD",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:MAIL_PASSWORD::"
    },
    {
    name      = "MAIL_FROM_ADDRESS",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:MAIL_FROM_ADDRESS::"
    },
    {
    name      = "MAIL_FROM_NAME",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:MAIL_FROM_NAME::"
    },
    {
    name      = "SEAGAGE_MAIL_USERNAME",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:SEAGAGE_MAIL_USERNAME::"
    },
    {
    name      = "SEAGAGE_MAIL_PASSWORD",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:SEAGAGE_MAIL_PASSWORD::"
    },
    {
    name      = "SEAGAGE_MAIL_FROM_ADDRESS",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:SEAGAGE_MAIL_FROM_ADDRESS::"
    },
    {
    name      = "SEAGAGE_MAIL_FROM_NAME",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:SEAGAGE_MAIL_FROM_NAME::"
    },
    {
    name      = "AWS_ACCESS_KEY_ID",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:AWS_ACCESS_KEY_ID::"
    },
    {
    name      = "AWS_SECRET_ACCESS_KEY",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:AWS_SECRET_ACCESS_KEY::"
    },
    {
    name      = "AWS_DEFAULT_REGION",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:AWS_DEFAULT_REGION::"
    },
    {
    name      = "AWS_BUCKET",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:AWS_BUCKET::"
    },
    {
    name      = "AWS_BUCKET_URL",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:AWS_BUCKET_URL::"
    },
    {
    name      = "JWT_SECRET",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:JWT_SECRET::"
    },
    {
    name      = "GITHUB_SHA",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:GITHUB_SHA::"
    },
    {
    name = "DEFAULT_LANG",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:DEFAULT_LANG::"
    },
    {
    name = "BROADCAST_DRIVER",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:BROADCAST_DRIVER::"
    },
    {
    name = "CACHE_DRIVER",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:CACHE_DRIVER::"
    },
    {
    name = "REDIS_HOST",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:REDIS_HOST::"
    },
    {
    name = "REDIS_PASSWORD",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:REDIS_PASSWORD::"
    },
    {
    name = "REDIS_PORT",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:REDIS_PORT::"
    },
    {
    name = "MAIL_MAILER",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:MAIL_MAILER::"
    },
    {
    name = "MAIL_PORT",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:MAIL_PORT::"
    },
    {
    name = "MAIL_ENCRYPTION",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:MAIL_ENCRYPTION::"
    },
    {
    name = "PUSHER_APP_CLUSTER",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:PUSHER_APP_CLUSTER::"
    },
    {
    name = "DATETIME",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:DATETIME::"
    },
    {
    name = "ENV",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:ENV::"
    },
    {
    name = "PUSHER_APP_ID",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:PUSHER_APP_ID::"
    },
    {
    name = "PUSHER_APP_KEY",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:PUSHER_APP_KEY::"
    },
    {
    name = "PUSHER_APP_SECRET",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:PUSHER_APP_SECRET::"
    },
    {
    name = "MIX_PUSHER_APP_KEY",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:MIX_PUSHER_APP_KEY::"
    },
    {
    name = "MIX_PUSHER_APP_CLUSTER",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Production-r7Neqb:MIX_PUSHER_APP_CLUSTER::"
    }



]
