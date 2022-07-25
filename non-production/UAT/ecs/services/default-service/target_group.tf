#resource "aws_lb_target_group_attachment" "default" {
#  target_group_arn = local.alb_target_group
#  target_id        = aws_instance.blue[count.index].id
#  port             = 80
#}
