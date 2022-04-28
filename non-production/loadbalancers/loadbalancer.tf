locals {

  vpc_id  = data.terraform_remote_state.network.outputs.vpc_id
  subnets = data.terraform_remote_state.network.outputs.public_subnets

}

resource "aws_s3_bucket" "alb-logs" {

  bucket = var.bucket

  tags = merge({
    Name        = var.bucket
  },var.tags)
}

resource "aws_s3_bucket_policy" "alb_to_s3_access" {
  bucket = aws_s3_bucket.alb-logs.id
 policy = data.aws_iam_policy_document.alb_access_s3.json

}

data "aws_iam_policy_document" "alb_access_s3" {

  statement {

    effect = "Allow"
    principals {

      type        = "AWS"
      identifiers = [data.aws_elb_service_account.main.arn]


    }
    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.alb-logs.arn}/*/AWSLogs/${data.aws_caller_identity.current.account_id}/*"]
  }

  statement {

    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["delivery.logs.amazonaws.com"]

    }
    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.alb-logs.arn}/*/AWSLogs/${data.aws_caller_identity.current.account_id}/*"]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"

      values = [
        "bucket-owner-full-control"
      ]

    }
  }
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["delivery.logs.amazonaws.com"]
    }
    actions   = ["s3:GetBucketAcl"]
    resources = [aws_s3_bucket.alb-logs.arn]
  }



}



module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.8.0"

  name = var.alb-name

  load_balancer_type = "application"

  vpc_id          = local.vpc_id
  subnets         = local.subnets
  security_groups = [aws_security_group.alb_group.id]

  access_logs = {
    bucket = var.bucket
    prefix = var.alb-log-prefix
  }
  enable_deletion_protection = true

  target_groups = [{
    name     = var.default-tg
    backend_protocol = "HTTP"
    backend_port     = 80
    target_type      = "ip"

    #targets = [
    #  {
    #    target_id = ""
    #    port = 80
    #  }
    #]
    lifecycle = {
      create_before_destroy = true
    }
    }
  ]

 http_tcp_listeners = [
    # Forward action is default, either when defined or undefined
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
      # action_type        = "forward"
    }]   
  
    http_tcp_listener_rules = [
    {
      http_tcp_listener_index = 0
      priority                = 3
      actions = [{
        type         = "forward"
        #content_type = "text/plain"
        #status_code  = 200
        #message_body = "This is a fixed response"
      }]

      conditions = [{

        host_headers = ["${var.host_header_domain}"]
    
       # host_headers = [{
          #host_header_name = "x-Gimme-Fixed-Response"
        #  values           = ["${var.host_header_domain}"]
        #}]
      }]
    }]

    
  #https_listeners = [
  #  {
  #    port               = 443
  #    protocol           = "HTTPS"
  #    certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
  #    target_group_index = 0
  #  }
  #]

  #http_tcp_listeners = [
  #  {
  #    port               = 80
  #    protocol           = "HTTP"
  #    target_group_index = 0
  #  }
  #]

  tags = merge(var.tags)
}
