module "metric_alarm" {
  source  = "terraform-aws-modules/cloudwatch/awsmodules/metric-alarm"
  version = "~> 2.0"

  alarm_name          = var.alarm_name
  alarm_description   = "Bad errors in my-application-logs"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  threshold           = var.threshold
  period              = 60
  unit                = "Count"

  namespace   = var.namespace
  metric_name = var.metric_name
  statistic   = "Maximum"

  alarm_actions = [""]
 dimensions = {//
    ClusterName =var.cluster
  }

}