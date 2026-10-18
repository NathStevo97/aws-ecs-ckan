# CKAN Cluster

# module "ckan-cluster" {
#   source                  = "./modules/ckan-cluster"
#   resource_name_prefix    = var.resource_name_prefix
#   hosted_zone_id          = var.hosted_zone_id
#   vpc_id                  = module.vpc.vpc_id
#   public_subnet_ids_list  = module.vpc.public_subnets
#   private_subnet_ids_list = module.vpc.private_subnets
#   allowed_cidr_blocks     = [var.vpc_cidr, var.admin_cidr_blocks]
#   domain_name             = var.domain_name
#   postgres_url            = var.domain_name != "" ? "postgres.${var.domain_name}" : module.postgres.db_instance_address
#   redis_url               = var.domain_name != "" ? "redis.${var.domain_name}" : module.redis.redis-address
#   #ckan_url                       = "ckan.${var.domain_name}"
#   aws_region                     = var.region
#   rds_database_name              = module.postgres.db_instance_name
#   rds_database_password          = var.rds_database_password
#   rds_database_username          = var.rds_database_username
#   rds_readonly_database_name     = var.rds_readonly_database_name
#   rds_readonly_database_password = var.rds_readonly_database_password
#   rds_readonly_database_user     = var.rds_readonly_database_user
#   lb_acm_certificate_arn         = var.lb_acm_certificate_arn
# }
