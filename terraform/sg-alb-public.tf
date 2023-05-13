# Creating a mainly security group 
resource "aws_security_group" "alb-public" {
  name_prefix = "${local.prefix}-sg-alb-public"
  description = "Public ALB SG Group"
  vpc_id      = aws_vpc.this.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    # Damos permiso desde el mundo exterior
    # Es probable que queramos dar solo acceso desde el load balancer mas adelante.
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  depends_on = [
    aws_vpc.this
  ]
}