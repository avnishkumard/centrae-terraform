resource "aws_cloudwatch_metric_alarm" "centrae_ab_ecs_cpu_utilization" {
  alarm_name          = var.ab_cpu_alarm_name
  alarm_description   = var.ab_cpu_alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  threshold           = var.threshold
  period              = 60
  unit                = "Count"
  datapoints_to_alarm       = 1

  namespace   = var.namespace
  metric_name = var.ab_cpu_metric_name
  statistic   = "Maximum"

  alarm_actions       = ["${var.sns_topic_cloudwatch_alarm_arn}"]
 dimensions = {
    ClusterName =var.cluster
    ServiceName =var.ab_service
  }

 // tags = var.tags

}

resource "aws_cloudwatch_metric_alarm" "centrae_ab_ecs_memory_utilization" {
  alarm_name          = var.ab_memory_alarm_name
  alarm_description   = var.ab_memory_alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  threshold           = var.threshold
  period              = 60
  unit                = "Count"
  datapoints_to_alarm       = 1

  namespace   = var.namespace
  metric_name = var.ab_memory_metric_name
  statistic   = "Maximum"

  alarm_actions       = ["${var.sns_topic_cloudwatch_alarm_arn}"]
 dimensions = {
    ClusterName =var.cluster
    ServiceName =var.ab_service
  }

  //tags = var.tags

}