# This file contains the loadbalancers for the accounts
# Currently we create two loadbalancers one in prod and one in non-prod
# The logical grouping is kept intact, for example any security group for the 
# load balancer will be stored here and so on.

resource "aws_s3_bucket" "alb-logs" {

  bucket = var.alb-s3-bucket-name

  tags = {
    Name = var.alb-s3-bucket-name
  }
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


resource "aws_security_group" "alb_sec_group-nonprod" {
  name        = "${var.alb-name[0]}-sg"
  description = "ALB rules"
  vpc_id      = aws_vpc.non-Prod-vpc.id

  ingress {
    description = "TLS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.alb_cidr_block]
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.alb_cidr_block]
  }



  tags = {
    Name = var.alb-name[0]
  }
}

resource "aws_security_group" "alb_sec_group-prod" {
  name        = "${var.alb-name[1]}-sg"
  description = "ALB rules"
  vpc_id      = aws_vpc.Prod-vpc.id

  ingress {
    description = "TLS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.alb_cidr_block]
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.alb_cidr_block]
  }



  tags = {
    Name = var.alb-name[1]
  }
}

#TODO Refactor
resource "aws_lb" "lb-non-prod" {
  name               = var.alb-name[0]
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sec_group-nonprod.id]
  subnets            = [aws_subnet.non-prod-pub-a.id, aws_subnet.non-prod-pub-b.id, aws_subnet.non-prod-pub-c.id, aws_subnet.non-prod-pub-d.id]

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.alb-logs.bucket
    prefix  = var.alb-log-prefix[0]
    enabled = true
  }

  depends_on = [
    aws_s3_bucket.alb-logs
  ]
  tags = {
    Environment = "non-production"
  }
}

resource "aws_lb_listener" "backend-nonprod" {
  load_balancer_arn = aws_lb.lb-non-prod.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-dummy-np.arn
  }
}


# Needs certificate https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener
#resource "aws_lb_listener" "backend-np" {
#  load_balancer_arn = aws_lb.lb-non-prod
#  port              = "443"
#  protocol          = "HTTPS"
#  ssl_policy        = "ELBSecurityPolicy-2016-08"
#  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
#
#  default_action {
#    type             = "forward"
#    target_group_arn = aws_lb_target_group.front_end.arn
#  }
#}
#
resource "aws_lb_target_group" "alb-dummy-np" {

  name        = "dummy-nonprod"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.non-Prod-vpc.id
lifecycle {
      create_before_destroy = true
    }
}

resource "aws_lb_listener_rule" "backend-host-rule-np" {
  listener_arn = aws_lb_listener.backend-nonprod.arn
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-dummy-np.arn
  }

  condition {
    host_header {
      values = ["dummydomain.com"]
    }
  }
}
resource "aws_lb" "lb-prod" {
  name               = var.alb-name[1]
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sec_group-prod.id]
  subnets            = [aws_subnet.prod-pub-a.id, aws_subnet.prod-pub-b.id, aws_subnet.prod-pub-c.id, aws_subnet.prod-pub-d.id]

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.alb-logs.bucket
    prefix  = var.alb-log-prefix[1]
    enabled = true
  }

  tags = {
    Environment = "production"
  }
  depends_on = [
    aws_s3_bucket.alb-logs
  ]

}

resource "aws_lb_listener" "backend-prod" {
  load_balancer_arn = aws_lb.lb-prod.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-dummy-p.arn
  }
}

# Needs certificate https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener
#resource "aws_lb_listener" "backend-np" {
#  load_balancer_arn = aws_lb.lb-non-prod
#  port              = "443"
#  protocol          = "HTTPS"
#  ssl_policy        = "ELBSecurityPolicy-2016-08"
#  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
#
#  default_action {
#    type             = "forward"
#    target_group_arn = aws_lb_target_group.front_end.arn
#  }
#}
#
resource "aws_lb_target_group" "alb-dummy-p" {

  name        = "dummy-prod"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.Prod-vpc.id
  lifecycle {
      create_before_destroy = true
    }
}

resource "aws_lb_listener_rule" "backend-host-rule-p" {
  listener_arn = aws_lb_listener.backend-prod.arn
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-dummy-p.arn
  }

  condition {
    host_header {
      values = ["dummydomain.com"]
    }
  }
}
