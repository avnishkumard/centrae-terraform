cpu_alarm_name = "centrae-staging-ecs-cpu-utilization"
threshold = 80
namespace = "AWS/ECS"
cpu_metric_name = "CPUUtilization"
cluster = "Staging"
service ="centrae-staging-service"
sns_topic_cloudwatch_alarm_arn = "arn:aws:sns:us-west-2:670015515275:centrae-alert-topic"
tags = {
  Terraform   = true
  Environment = "staging"
  }

memory_alarm_name="centrae-staging-ecs-memory-utilization"  
memory_metric_name = "MemoryUtilization"