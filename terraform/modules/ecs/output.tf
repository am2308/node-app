#output "cluster_id" {
#  value = module.ecs-cluster.aws_ecs_cluster_cluster_id
#}

#output "target_group_arn" {
#  value = module.ecs-alb.aws_lb_target_group_arn
#}

output "aws_lb_lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = aws_lb.lb.dns_name
}

output "aws_lb_lb_zone_id" {
  description = "The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record)."
  value       = aws_lb.lb.zone_id
}