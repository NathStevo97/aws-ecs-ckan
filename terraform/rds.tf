# Postgres RDS Module

module "postgres" {
  source                  = "./modules/postgres"
  resource_name_prefix    = var.resource_name_prefix
  domain_name             = var.domain_name
  hosted_zone_id          = var.hosted_zone_id
  vpc_id                  = module.vpc.vpc_id
  private_subnet_ids_list = module.vpc.private_subnets
  rds_database_name       = var.rds_database_name
  rds_database_password   = var.rds_database_password
  rds_database_username   = var.rds_database_username
  allowed_cidr_blocks     = [var.vpc_cidr, var.admin_cidr_blocks]
  rds_instance_class      = var.rds_instance_class
}
