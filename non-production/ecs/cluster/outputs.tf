output "ecs_cluster_name" {
  value = [for a in aws_ecs_cluster.ecs-cluster: a.name]
}
output "ecs_cluster_arn" {
  value = [for a in aws_ecs_cluster.ecs-cluster: a.arn]
}

output "ecs_cluster_id" {
  value = [for a in aws_ecs_cluster.ecs-cluster: a.id]
}
output "ecs_cluster_map" {
  value = {for a in aws_ecs_cluster.ecs-cluster: a.name => a.arn}
}

output "ecsTaskExecutionRole_arn" {
value  = aws_iam_role.ecs_role.arn
}

output "ecsTaskExecutionRole_name" {
value  = aws_iam_role.ecs_role.name
}

output "ecsTaskExecutionRole_map" {
value =  {"${aws_iam_role.ecs_role.name}" = "${aws_iam_role.ecs_role.arn}"}
}
