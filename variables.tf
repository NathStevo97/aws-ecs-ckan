variable "admin_cidr_blocks" {
  type        = string
  default     = ""
  description = "CIDR block(s) to allow access to the CKAN admin interface, e.g. 10.0.0.0/8"
}

variable "availability_zone_map" {
  type = map(any)
  default = {
    a = 0,
    b = 1,
    c = 2
  }
  description = "A map of availability zones to use for the CKAN deployment, e.g. { a = 0, b = 1, c = 2 }"
}

variable "ckan_admin" {
  type        = string
  description = "Username for the CKAN admin user"
}

variable "ckan_admin_password" {
  type        = string
  description = "Password for the CKAN admin user"
}

variable "domain_name" {
  type        = string
  default     = ""
  description = "The domain name for the CKAN instance e.g. ckan.example.com"
}

variable "hosted_zone_id" {
  type        = string
  default     = ""
  description = "The ID of the Route53 hosted zone to use for the CKAN instance"
}

variable "rds_instance_class" {
  type        = string
  description = "Database instance type e.g. db.t2.micro, this can be adjusted to suit using the options at https://aws.amazon.com/rds/instance-types/"
  default     = "db.t2.micro"
}

variable "lb_acm_certificate_arn" {
  type        = string
  default     = ""
  description = "The ARN of the ACM certificate to use for the load balancer - assuming a pre-existing certificate is being used, this can be obtained from the AWS console or via the AWS CLI"
}

variable "region" {
  type        = string
  default     = "eu-west-2"
  description = "The AWS region to deploy the CKAN instance in"
}

variable "resource_name_prefix" {
  type        = string
  default     = "ckan"
  description = "A prefix to use for all resource names, to help identify them in the AWS console"
}

variable "rds_database_name" {
  type        = string
  default     = "ckan"
  description = "The name of the RDS database to create for CKAN"
}

variable "rds_database_username" {
  type        = string
  default     = "ckan"
  description = "The username for the RDS database to create for CKAN"

}

variable "rds_database_password" {
  type        = string
  default     = "ckan"
  description = "The password for the RDS database to create for CKAN"
}

variable "rds_readonly_database_name" {
  type        = string
  default     = "ckan_readonly"
  description = "The name of the RDS database to create for CKAN read-only access"
}

variable "rds_readonly_database_user" {
  type        = string
  default     = "readonly"
  description = "The username for the RDS database to create for CKAN read-only access"
}

variable "rds_readonly_database_password" {
  type        = string
  default     = "readonly"
  description = "The password for the RDS database to create for CKAN read-only access"
}

variable "vpc_cidr" {
  type        = string
  default     = ""
  description = "The CIDR block to be set up in the VPC for the CKAN deployment, e.g. 10.0.0.0/16"
}
