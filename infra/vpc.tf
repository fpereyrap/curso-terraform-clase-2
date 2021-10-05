module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.vpc_name
  cidr = local.vpc_cidr

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = [cidrsubnet(local.vpc_cidr, 2, 0), cidrsubnet(local.vpc_cidr, 2, 1)]
  public_subnets  = [cidrsubnet(local.vpc_cidr, 2, 2), cidrsubnet(local.vpc_cidr, 2, 3)]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = local.environment
  }
}