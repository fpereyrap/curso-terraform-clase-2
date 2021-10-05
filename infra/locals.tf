locals {
    environment = "dev"
    vpc_cidr = "10.1.0.0/16"
    vpc_name = "${local.environment}-vpc"
}