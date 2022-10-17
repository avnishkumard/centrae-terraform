task_cpu       = 512
task_mem       = 1024
family         = "centrae-staging-service"
log_group_name = "/ecscentrae-staging"

ecs_cluster_key = "Staging"

cd_cpu  = 512
cd_mem  = 1024
cd_name = "centrae-staging-service"

cd_portMappings = [{
  containerPort = 80
  hostPort      = 80
}]

ecs_service_name = "centrae-staging-service"

lb_container_name = "centrae-staging-service"
lb_container_port = "80"
tags = {
  Terraform   = true
  Environment = "staging"
}
awslogs-region = "us-west-2"
sec_group_name = "ecs-staging"

host_header_domain = "api.staging.centrae.com"

lb_name = "Non-Production"


env_vars = [
 {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:API_HOST::",
          "name": "API_HOST"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:API_PORT::",
          "name": "API_PORT"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:APP_DEBUG::",
          "name": "APP_DEBUG"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:APP_ENV::",
          "name": "APP_ENV"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:APP_KEY::",
          "name": "APP_KEY"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:APP_NAME::",
          "name": "APP_NAME"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:APP_URL::",
          "name": "APP_URL"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:AWS_ACCESS_KEY_ID::",
          "name": "AWS_ACCESS_KEY_ID"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:AWS_BUCKET::",
          "name": "AWS_BUCKET"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:AWS_BUCKET_URL::",
          "name": "AWS_BUCKET_URL"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:AWS_DEFAULT_REGION::",
          "name": "AWS_DEFAULT_REGION"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:AWS_SECRET_ACCESS_KEY::",
          "name": "AWS_SECRET_ACCESS_KEY"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:DB_HOST::",
          "name": "DB_HOST"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:DB_DATABASE::",
          "name": "DB_DATABASE"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:DB_PASSWORD::",
          "name": "DB_PASSWORD"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:DB_USERNAME::",
          "name": "DB_USERNAME"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:DEBUG::",
          "name": "DEBUG"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:JWT_TOKEN::",
          "name": "JWT_TOKEN"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:JWT_SECRET::",
          "name": "JWT_SECRET"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:LOG_CHANNEL::",
          "name": "LOG_CHANNEL"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:MAIL_FROM_ADDRESS::",
          "name": "MAIL_FROM_ADDRESS"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:MAIL_FROM_NAME::",
          "name": "MAIL_FROM_NAME"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:MAIL_HOST::",
          "name": "MAIL_HOST"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:MAIL_PASSWORD::",
          "name": "MAIL_PASSWORD"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:MAIL_USERNAME::",
          "name": "MAIL_USERNAME"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:PDF_HOST::",
          "name": "PDF_HOST"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:SEAGAGE_MAIL_FROM_ADDRESS::",
          "name": "SEAGAGE_MAIL_FROM_ADDRESS"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:SEAGAGE_MAIL_FROM_NAME::",
          "name": "SEAGAGE_MAIL_FROM_NAME"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:SEAGAGE_MAIL_PASSWORD::",
          "name": "SEAGAGE_MAIL_PASSWORD"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:SEAGAGE_MAIL_USERNAME::",
          "name": "SEAGAGE_MAIL_USERNAME"
        },
        {
          "valueFrom": "arn:aws:secretsmanager:us-west-2:670015515275:secret:Staging-Z40mev:SESSION_LIFETIME::",
          "name": "SESSION_LIFETIME"
        }

]
