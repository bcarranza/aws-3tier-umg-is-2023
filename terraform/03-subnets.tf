# Subnet application 1
resource "aws_subnet" "application-subnet-1" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = local.vpc.cidr_subnet1
  map_public_ip_on_launch = false
  availability_zone = "us-east-1a"
  tags = {
    Name        = "${local.prefix}-application-subnet-1"
    Environment = local.env
    Path        = "${basename(abspath(path.module))}/03-subnets.tf"
  }
  depends_on = [
    aws_vpc.this
  ]
}

# Subnet application 2
resource "aws_subnet" "application-subnet-2" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = local.vpc.cidr_subnet2
  map_public_ip_on_launch = false
  availability_zone = "us-east-1a"
  tags = {
    Name        = "${local.prefix}-application-subnet-2"
    Environment = local.env
    Path        = "${basename(abspath(path.module))}/03-subnets.tf"
  }
  depends_on = [
    aws_vpc.this
  ]
}