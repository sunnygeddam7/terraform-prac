provider "aws" {
  region = "us-east-1"
}

module "vpc" {
    source = "./modules/vpc"
    name = var.Name

}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
}

module "RT" {
  source = "./modules/RT"
  igw_id = module.igw.igw
  vpc_id = module.vpc.vpc_id
  cidr = var.cidr
  subnet_id = module.vpc.subnet_id
}

module "ec2" {
  source = "./modules/ec2"
  sg_id = module.vpc.sg1
  subnet_id = module.vpc.subnet_id
}