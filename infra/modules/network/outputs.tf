output "vpc_id" {
  description = "VPC ID."
  value       = module.vpc.vpc_id
}

output "private_subnet_ids" {
  description = "SUBNET IDS."
  value       = module.vpc.private_subnets
}

output "target_group_arn" {
  description = "SUBNET IDS."
  value       = aws_lb_target_group.alb_tg.arn
}

output "sg_ec2_id" {
  description = "SUBNET IDS."
  value       = aws_security_group.sg_ec2.id
}