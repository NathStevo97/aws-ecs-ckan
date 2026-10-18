# Redis Elasticache Module

module "redis" {
  source                  = "./modules/redis"
  resource_name_prefix    = var.resource_name_prefix
  domain_name             = var.domain_name
  hosted_zone_id          = var.hosted_zone_id
  vpc_id                  = module.vpc.vpc_id
  private_subnet_ids_list = module.vpc.private_subnets
  allowed_cidr_blocks     = [var.vpc_cidr, var.admin_cidr_blocks]
}
