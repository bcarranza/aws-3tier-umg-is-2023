# Creating a mainly security group 
resource "aws_security_group" "this" {
  name_prefix = "${local.prefix}-sg"
  description = "mainly sg in umg-is-user"
  vpc_id      = aws_vpc.this.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["192.168.0.0/16"]
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