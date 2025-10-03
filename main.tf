terraform {
  backend "s3" {
    bucket         = "murali-simple-clahan"
    key            = "terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source           = "./modules/vpc"
  vpc_name         = var.vpc_name
  vpc_cidr         = var.vpc_cidr
  vpc_tenancy      = var.vpc_tenancy
  enable_dns       = var.vpc_dns_support
  enable_public_ip = var.enable_public_ip
}

module "ec2" {
  source         = "./modules/ec2"
  ami            = var.ami
  key_name       = var.key_name
  instance_name  = var.instance_name
  reference_name = var.reference_name
  subnet_id      = module.vpc.subnet_id
  sg_id          = module.vpc.sg_id
}
