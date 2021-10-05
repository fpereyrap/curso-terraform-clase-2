module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.vpc_name
  cidr = local.vpc_cidr

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = [cidrsubnet(var.cidr_block, 2, 0), cidrsubnet(var.cidr_block, 2, 1)]
  public_subnets  = [cidrsubnet(var.cidr_block, 2, 2), cidrsubnet(var.cidr_block, 2, 3)]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = local.environment
  }
}