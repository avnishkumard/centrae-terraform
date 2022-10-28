cpu_alarm_name = "centrae-prod-ecs-cpu-utilization"
threshold = 80
namespace = "AWS/ECS"
cpu_metric_name = "CPUUtilization"
cluster = "Production"
service ="centrae-assessments-be-prod"
sns_topic_cloudwatch_alarm_arn = "arn:aws:sns:us-west-2:670015515275:centrae-alert-topic"
tags = {
  Terraform   = true
  Environment = "production"
  }

memory_alarm_name="centrae-prod-ecs-memory-utilization"  
memory_metric_name = "MemoryUtilization"