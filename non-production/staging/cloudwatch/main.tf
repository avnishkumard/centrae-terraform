resource "aws_cloudwatch_metric_alarm" "centrae_ecs_cpu_utilization" {
  alarm_name          = var.cpu_alarm_name
  alarm_description   = var.cpu_alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  threshold           = var.threshold
  period              = 60
  unit                = "Count"

  namespace   = var.namespace
  metric_name = var.cpu_metric_name
  statistic   = "Maximum"

  alarm_actions       = ["${var.sns_topic_cloudwatch_alarm_arn}"]
 dimensions = {
    ClusterName =var.cluster
    ServiceName =var.service
  }

  tags = var.tags

}

resource "aws_cloudwatch_metric_alarm" "centrae_ecs_memory_utilization" {
  alarm_name          = var.memory_alarm_name
  alarm_description   = var.memory_alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  threshold           = var.threshold
  period              = 60
  unit                = "Count"

  namespace   = var.namespace
  metric_name = var.memory_metric_name
  statistic   = "Maximum"

  alarm_actions       = ["${var.sns_topic_cloudwatch_alarm_arn}"]
 dimensions = {
    ClusterName =var.cluster
    ServiceName =var.service
  }

  tags = var.tags

}