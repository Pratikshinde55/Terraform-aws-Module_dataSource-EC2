###############............"TeamC"..........###############

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.42.0"
    }
  }
}

provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}

          #..........module-calling block

module "TeamB-calling-ec2_module" {
  source  = "../module/ec2-module"
  tagname = "OS-by-TeamC"
  OStype  = "t2.small"
  security_grp_name = "sec-grp-TeamC"
  vpcID = "vpc-071ddf3f50a17a539"
}

