  ab_cpu_alarm_name = "centrae-uat-ab-ecs-cpu-utilization"
  threshold = 80
  namespace = "AWS/ECS"
  ab_cpu_metric_name = "CPUUtilization"
  cluster = "uat"
  ab_service ="centrae-uat-ab-service"
  sns_topic_cloudwatch_alarm_arn = "arn:aws:sns:us-west-2:670015515275:centrae-alert-topic"
  /*tags = {
    Terraform   = true
    Environment = "uat"
    }*/

  ab_memory_alarm_name="centrae-uat-ab-ecs-memory-utilization"  
  ab_memory_metric_name = "MemoryUtilization"