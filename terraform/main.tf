module "vpc" {
  source = "./modules/vpc"

  project               = var.project
  env                   = var.env
  region                = var.region
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
  public_subnet_1_cidr  = var.public_subnet_1_cidr
  public_subnet_2_cidr  = var.public_subnet_2_cidr
  vpc_cidr              = var.vpc_cidr
}

module "ecs" {
  source = "./modules/ecs"

  env                                            = var.env
  region                                         = var.region
  name                                           = var.name
  project                                        = var.project
  log_group_kms_key_id                           = var.log_group_kms_key_id
  log_group_retention_in_days                    = var.log_group_retention_in_days
  create_kms_key                                 = var.create_kms_key
  ecr_repository_name                            = var.ecr_repository
  vpc_id                                         = module.vpc.vpc_id
  containerInsights                              = var.containerInsights
  lb_enable_cross_zone_load_balancing            = var.lb_enable_cross_zone_load_balancing
  enable_s3_logs                                 = var.enable_s3_logs
  block_s3_bucket_public_access                  = var.block_s3_bucket_public_access
  enable_s3_bucket_server_side_encryption        = var.enable_s3_bucket_server_side_encryption
  s3_bucket_server_side_encryption_sse_algorithm = var.s3_bucket_server_side_encryption_sse_algorithm
  s3_bucket_server_side_encryption_key           = var.s3_bucket_server_side_encryption_key
  public_subnets_ids                             = module.vpc.public_subnets_ids
  private_subnets_ids                            = module.vpc.private_subnets_ids
  URL                                            = var.URL
  secret_arn                                     = var.secret_arn
}

