output "cluster_id" {
  value = module.ecs-cluster.cluster_id
}

output "target_group_arn" {
  value = module.ecs-alb.aws_lb_target_group_arn
}