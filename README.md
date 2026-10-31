# CKAN on AWS

Repository containing code to deploy a sample version of CKAN to AWS via Terraform.

## Tech Stack

- `AWS`
- `Docker`
- `Docker-Compose` (Local Testing)
- `Terraform`

## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.17.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.71.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| <a name="module_postgres"></a> [postgres](#module\_postgres) | ./modules/postgres | n/a |
| <a name="module_redis"></a> [redis](#module\_redis) | ./modules/redis | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 6.6.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_admin_cidr_blocks"></a> [admin\_cidr\_blocks](#input\_admin\_cidr\_blocks) | CIDR block(s) to allow access to the CKAN admin interface, e.g. 10.0.0.0/8 | `string` | `""` | no |
| <a name="input_availability_zone_map"></a> [availability\_zone\_map](#input\_availability\_zone\_map) | A map of availability zones to use for the CKAN deployment, e.g. { a = 0, b = 1, c = 2 } | `map(any)` | <pre>{<br/>  "a": 0,<br/>  "b": 1,<br/>  "c": 2<br/>}</pre> | no |
| <a name="input_ckan_admin"></a> [ckan\_admin](#input\_ckan\_admin) | Username for the CKAN admin user | `string` | n/a | yes |
| <a name="input_ckan_admin_password"></a> [ckan\_admin\_password](#input\_ckan\_admin\_password) | Password for the CKAN admin user | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name for the CKAN instance e.g. ckan.example.com | `string` | `""` | no |
| <a name="input_hosted_zone_id"></a> [hosted\_zone\_id](#input\_hosted\_zone\_id) | The ID of the Route53 hosted zone to use for the CKAN instance | `string` | `""` | no |
| <a name="input_lb_acm_certificate_arn"></a> [lb\_acm\_certificate\_arn](#input\_lb\_acm\_certificate\_arn) | The ARN of the ACM certificate to use for the load balancer - assuming a pre-existing certificate is being used, this can be obtained from the AWS console or via the AWS CLI | `string` | `""` | no |
| <a name="input_rds_database_name"></a> [rds\_database\_name](#input\_rds\_database\_name) | The name of the RDS database to create for CKAN | `string` | `"ckan"` | no |
| <a name="input_rds_database_password"></a> [rds\_database\_password](#input\_rds\_database\_password) | The password for the RDS database to create for CKAN | `string` | `"ckan"` | no |
| <a name="input_rds_database_username"></a> [rds\_database\_username](#input\_rds\_database\_username) | The username for the RDS database to create for CKAN | `string` | `"ckan"` | no |
| <a name="input_rds_instance_class"></a> [rds\_instance\_class](#input\_rds\_instance\_class) | Database instance type e.g. db.t2.micro, this can be adjusted to suit using the options at <https://aws.amazon.com/rds/instance-types/> | `string` | `"db.t2.micro"` | no |
| <a name="input_rds_readonly_database_name"></a> [rds\_readonly\_database\_name](#input\_rds\_readonly\_database\_name) | The name of the RDS database to create for CKAN read-only access | `string` | `"ckan_readonly"` | no |
| <a name="input_rds_readonly_database_password"></a> [rds\_readonly\_database\_password](#input\_rds\_readonly\_database\_password) | The password for the RDS database to create for CKAN read-only access | `string` | `"readonly"` | no |
| <a name="input_rds_readonly_database_user"></a> [rds\_readonly\_database\_user](#input\_rds\_readonly\_database\_user) | The username for the RDS database to create for CKAN read-only access | `string` | `"readonly"` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to deploy the CKAN instance in | `string` | `"eu-west-2"` | no |
| <a name="input_resource_name_prefix"></a> [resource\_name\_prefix](#input\_resource\_name\_prefix) | A prefix to use for all resource names, to help identify them in the AWS console | `string` | `"ckan"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The CIDR block to be set up in the VPC for the CKAN deployment, e.g. 10.0.0.0/16 | `string` | `""` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_database_address"></a> [database\_address](#output\_database\_address) | n/a |
| <a name="output_redis_address"></a> [redis\_address](#output\_redis\_address) | n/a |
