data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}
afdadfadfa
output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}

data "aws_elb_service_account" "main" {}
