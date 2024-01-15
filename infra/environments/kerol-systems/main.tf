locals {
  region       = "us-west-2"
  cluster_name = "devops-cluster-prod"
}

module "network" {
  source       = "../../modules/network"
}


module "app" {
  source       = "../../modules/application"
  private_subnet_ids = module.network.private_subnet_ids
  target_group_arn = module.network.target_group_arn
  sg_ec2_id = module.network.sg_ec2_id
}