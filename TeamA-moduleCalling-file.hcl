####################  team-A #######  
#......TeamA-plugin & module calling block


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

#module-calling block

module "TeamA-calling-ec2_module" {
  source  = "../module/ec2-module"
  tagname = "OS-by-TeamA"
  OStype  = "t2.micro"
  security_grp_name = "sec-grp-TeamA"
  vpcID = "vpc-071ddf3f50a17a539"
}







