terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
    region = "ap-southeast-1"
}

module "key" {
    source = "./submodules/key"
}

module "vpc" {
    source = "./submodules/vpc"
}

module "ec2" {
    source = "./submodules/ec2"
    public_id = module.vpc.public_id
    key_name = module.key.key_name
    sg_id = module.vpc.sg_id
}