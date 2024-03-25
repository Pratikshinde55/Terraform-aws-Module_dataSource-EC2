#  "teamA"

######### provider plugin #######  
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

################## module block -- call ec2 module ###########

module "ps1A" {
  source = "../module/ec2"
   tagname = "myosteamA"
}

