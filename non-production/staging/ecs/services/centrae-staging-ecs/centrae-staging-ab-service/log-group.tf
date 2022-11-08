resource "aws_cloudwatch_log_group" "ab_log_group" {
  name = var.log_group_name
  tags = merge(var.tags)
  retention_in_days = 7
}
