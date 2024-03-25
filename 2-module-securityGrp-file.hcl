# varible
variable "sgports" {
  type    = list(number)
  default = [22, 8080, 80, 1234]
}

#allow inbound traffic

resource "aws_security_group" "allow" {
  name        = "terra_allow"
  description = " allow inbound "
  vpc_id      = "vpc-071ddf3f50a17a539"

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
