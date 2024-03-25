# Data source for get aws_ami

data "aws_ami" "amazonaminame" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

#module for EC2

resource "aws_instance" "web" {
  ami                    = data.aws_ami.amazonaminame.id
  vpc_security_group_ids = [aws_security_group.allow.id]
  instance_type          = var.OStype
  tags = {
    Name = var.tagname
  }
}

variable "tagname" {

}

variable "OStype" {

}

