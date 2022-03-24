resource "aws_cloudwatch_metric_alarm" "ecs-alert_High-CPUReservation" {
  alarm_name = var.high-cpu-utilaztion-alarm-name
  comparison_operator = "GreaterThanOrEqualToThreshold"

  period = var.period
  evaluation_periods = var.evaluation_periods
  datapoints_to_alarm = 1

  # second
  statistic = "Average"
  threshold = var.cpu_utilization_high_threshold
  alarm_description = ""

  metric_name = "CPUUtilization"
  namespace = "AWS/ECS"
  dimensions = {
    ClusterName =var.cluster
  }

  actions_enabled = true
  insufficient_data_actions = []
  ok_actions = []
}
resource "aws_cloudwatch_metric_alarm" "loadbalancer_4xx" {
  alarm_name = var.high-cpu-utilaztion-alarm-name
  comparison_operator = "GreaterThanOrEqualToThreshold"

  period = var.period
  evaluation_periods = var.evaluation_periods
  datapoints_to_alarm = 1

  # second
  statistic = "Average"
  threshold = var.cpu_utilization_high_threshold
  alarm_description = ""

  metric_name = "HTTPCode_ELB_4XX_Count"
  namespace = "AWS/ApplicationELB"
  dimensions = {
    LoadBalancer = var.load_name
  }

  actions_enabled = true
  insufficient_data_actions = []
  ok_actions = []
}
resource "aws_cloudwatch_metric_alarm" "loadbalancer_5xx" {
  alarm_name = var.high-cpu-utilaztion-alarm-name
  comparison_operator = "GreaterThanOrEqualToThreshold"

  period = var.period
  evaluation_periods = var.evaluation_periods
  datapoints_to_alarm = 1

  # second
  statistic = "Average"
  threshold = var.cpu_utilization_high_threshold
  alarm_description = ""

  metric_name = "HTTPCode_ELB_5XX_Count"
  namespace = "AWS/ApplicationELB"
  dimensions = {
    LoadBalancer = var.load_name
  }

  actions_enabled = true
  insufficient_data_actions = []
  ok_actions = []
}

resource "aws_cloudwatch_metric_alarm" "ecs-alert-servicecount" {
  alarm_name = var.ecs-alert-servicecount
  comparison_operator = "LessThanOrEqualToThreshold"

  period = var.period
  evaluation_periods = var.evaluation_periods
  datapoints_to_alarm = 1

  # second
  statistic = "Average"
  threshold = var.cpu_utilization_Low_threshold
  alarm_description = ""

  metric_name = "ServiceCount"
  namespace = "AWS/ECS"
  dimensions = {
    ClusterName = var.cluster
  }

  actions_enabled = true
  insufficient_data_actions = []
  ok_actions = []
}


resource "aws_cloudwatch_metric_alarm" "ecs-alert_High-MEMReservation" {
  alarm_name = var.high-mem-utilaztion-alarm-name
  comparison_operator = "GreaterThanOrEqualToThreshold"

  period = var.period
  evaluation_periods = var.evaluation_periods
  datapoints_to_alarm = 1

  # second
  statistic = "Average"
  threshold = var.cpu_utilization_high_threshold
  alarm_description = ""

  metric_name = "MemoryUtilization"
  namespace = "AWS/ECS"
  dimensions = {
    ClusterName = var.cluster
  }

  actions_enabled = true
  insufficient_data_actions = []
  ok_actions = []
}



resource "aws_cloudwatch_metric_alarm" "ecs-alert_High-Network" {
  alarm_name = var.high-network-utilaztion-alarm-name
  comparison_operator = "GreaterThanOrEqualToThreshold"

  period = var.period
  evaluation_periods = var.evaluation_periods
  datapoints_to_alarm = 1

  # second
  statistic = "Average"
  threshold = var.cpu_utilization_high_threshold
  alarm_description = ""

  metric_name = "NetworkTxBytes"
  namespace = "AWS/ECS"
  dimensions = {
    ClusterName = var.cluster
  }

  actions_enabled = true
  insufficient_data_actions = []
  ok_actions = []
}
