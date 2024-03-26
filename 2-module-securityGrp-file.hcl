
############################...."allow inbound traffic"....##################

resource "aws_security_group" "allow" {
  name        = "terra_allow_${var.security_grp_name}"
  description = " allow inbound "
  vpc_id      = var.vpcID

   dynamic "ingress" {
     for_each = var.sgports
     iterator = port
       content {
           description = "TLS from vpc"
           from_port    = port.value
           to_port     = port.value
           protocol    = "tcp"
           cidr_blocks = ["0.0.0.0/0"]
        }
   }

   egress {
      from_port    = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

}

################# varibles ###############

variable "sgports" {
  type    = list(number)
  default = [22, 8080, 80, 1234]
}


### "varible for security group name "

variable "security_grp_name" {
      type    = string

}

 ### "varible for VPC id "

variable "vpcID" {

}
