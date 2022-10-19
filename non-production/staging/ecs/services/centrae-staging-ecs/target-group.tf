data "aws_lb" "staging" {
  name = var.lb_name
}
data "aws_acm_certificate" "cert_global" {
  domain = "*.centrae.com"
  statuses = ["ISSUED"] 
}

/*
data "aws_acm_certificate" "ab_cert_global" {
  domain = "staging.ab.centrae.com"
  statuses = ["ISSUED"] 
}
*/

#resource "aws_lb_target_group_attachment" "test" {
  #target_group_arn = aws_lb_target_group.tg.arn
  #target_id        = data.aws_lb.staging.id
  #depends_on       = [aws_lambda_permission.with_lb]
#}

resource "aws_lb_target_group" "tg" {
    name        = var.ecs_service_name
    port        = 80
    protocol    = "HTTP"
    vpc_id      = local.vpc_id
    target_type = "ip"
    depends_on = [data.aws_lb.staging,]
    lifecycle {
      create_before_destroy = true
    }
}

resource "aws_lb_target_group" "ab_tg" {
    name        = var.ab_ecs_service_name
    port        = 80
    protocol    = "HTTP"
    vpc_id      = local.vpc_id
    target_type = "ip"
    depends_on = [data.aws_lb.staging,]
    lifecycle {
      create_before_destroy = true
    }
health_check {
          path = "/api/status"
        }


}




resource "aws_lb_listener" "test" {
  load_balancer_arn = data.aws_lb.staging.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.aws_acm_certificate.cert_global.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

resource "aws_lb_listener_rule" "listner" {
    #for_each = toset(local.alb_https_listener_arns)
    #listener_arn = each.value
    listener_arn = aws_lb_listener.test.arn
    priority     = 100

    action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.tg.arn
    }

    condition {
        host_header {
            values = ["${var.host_header_domain}"]
        }
    }

}

resource "aws_lb_listener_rule" "ab_listner" {
    #for_each = toset(local.alb_https_listener_arns)
    #listener_arn = each.value
    listener_arn = aws_lb_listener.test.arn
    priority     = 500

    action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.ab_tg.arn
    }

    condition {
        host_header {
            values = ["${var.ab_host_header_domain}"]
        }
    }

}


