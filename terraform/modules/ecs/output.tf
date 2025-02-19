output "aws_lb_lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = module.ecs-alb.aws_lb_lb_dns_name
}

output "aws_lb_lb_zone_id" {
  description = "The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record)."
  value       = module.ecs-alb.aws_lb_lb_zone_id
}