locals {

  vpc_id          = data.terraform_remote_state.network.outputs.vpc_id
  public_subnets = data.terraform_remote_state.network.outputs.public_subnets
  private_subnets  = data.terraform_remote_state.network.outputs.private_subnets
  ecs_cluster_names     = data.terraform_remote_state.ecs.outputs.ecs_cluster_name
  ecs_cluster_map     = data.terraform_remote_state.ecs.outputs.ecs_cluster_map
  ecs_cluster_id     = data.terraform_remote_state.ecs.outputs.ecs_cluster_id
  ecsTaskExecutionRole_arn     = data.terraform_remote_state.ecs.outputs.ecsTaskExecutionRole_arn
  ecsTaskExecutionRole_map    = data.terraform_remote_state.ecs.outputs.ecsTaskExecutionRole_map
  ecsTaskExecutionRole_name    = data.terraform_remote_state.ecs.outputs.ecsTaskExecutionRole_name
  alb_arn =  data.terraform_remote_state.alb.outputs.target_group_arns
  alb_sec = data.terraform_remote_state.alb.outputs.security_group
  alb_sec_id = local.alb_sec.id
  alb_target_group = data.terraform_remote_state.alb.outputs.target_group_arns[0]
}
