task_cpu       = 256
task_mem       = 512
family         = "centrae-staging-service"
log_group_name = "/ecscentrae-staging"

ecs_cluster_key = "Staging"

cd_cpu  = 256
cd_mem  = 512
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

host_header_domain = "staging.centrae.com"

lb_name = "Non-Production"


env_vars = [
  {
    name      = "DB_HOST",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:DB_HOST::"
    }, {
    name      = "DB_NAME",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:DB_NAME_STAGING::"
    }, {
    name      = "DB_PASSWORD",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:DB_PASSWORD::"
    }, {
    name      = "DB_USER",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:DB_USER::"
    }, {
    name      = "API_HOST",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:API_HOST::"
  },
  {
    name      = "PDF_HOST",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:PDF_HOST::"
  },
  {
    name      = "JWT_TOKEN",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:JWT_TOKEN::"
  },

  {
    name      = "DEBUG",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:DEBUG::"
  },

  {
    name      = "APP_NAME",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:APP_NAME::"
  },
  {
    name      = "APP_ENV",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:APP_ENV::"
  },
  {
    name      = "APP_KEY",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:APP_KEY::"
  },
  {
    name      = "APP_DEBUG",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:APP_DEBUG::"
  },

  {
    name      = "APP_URL",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:APP_URL::"
  },

  {
    name      = "API_PORT",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:API_PORT::"
  },

  {
    name      = "LOG_CHANNEL",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:LOG_CHANNEL::"
  },

  {
    name      = "SESSION_LIFETIME",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:SESSION_LIFETIME::"
  },

  {
    name      = "MAIL_HOST",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:MAIL_HOST::"
  },

  {
    name      = "MAIL_USERNAME",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:MAIL_USERNAME::"
  },

  {
    name      = "MAIL_PASSWORD",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:MAIL_PASSWORD::"
  },

  {
    name      = "MAIL_FROM_ADDRESS",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:MAIL_FROM_ADDRESS::"
  },
  {
    name      = "MAIL_FROM_NAME",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:MAIL_FROM_NAME::"
  },

  {
    name      = "SEAGAGE_MAIL_USERNAME",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:SEAGAGE_MAIL_USERNAME::"
  },
  {
    name      = "SEAGAGE_MAIL_PASSWORD",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:SEAGAGE_MAIL_PASSWORD::"
  },

  {
    name      = "SEAGAGE_MAIL_FROM_ADDRESS",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:SEAGAGE_MAIL_FROM_ADDRESS::"
  },
  {
    name      = "SEAGAGE_MAIL_FROM_NAME",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:SEAGAGE_MAIL_FROM_NAME::"
  },
  {
    name      = "AWS_ACCESS_KEY_ID",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:AWS_ACCESS_KEY_ID::"
  },
  {
    name      = "AWS_SECRET_ACCESS_KEY",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:AWS_SECRET_ACCESS_KEY::"
  },
  {
    name      = "AWS_DEFAULT_REGION",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:AWS_DEFAULT_REGION::"
  },
  {
    name      = "AWS_BUCKET",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:AWS_BUCKET::"
  },
  {
    name      = "AWS_BUCKET_URL",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:AWS_BUCKET_URL::"
  },
  {
    name      = "JWT_SECRET",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:JWT_SECRET::"
  },
  {
    name      = "GITHUB_SHA",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:GITHUB_SHA::"
  },
  {
    name      = "GITHUB_ACTOR",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:GITHUB_ACTOR::"
  }
]
