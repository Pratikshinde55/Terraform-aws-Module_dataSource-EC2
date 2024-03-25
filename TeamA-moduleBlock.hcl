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

################## module block -- call ec2 module---- teamA ###########

module "ps1A" {
  source = "../module/ec2"
   tagname = "myosteamA"
}


#########   teamB  #######
module "ps1A" {
  source = "../module/ec2"
  tagname = "teamB"
}

###############################
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



module "TeamC-ps" {
  source = "../module/ec2"
  tagname = "teamC"
}



