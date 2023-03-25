locals {
  prefix = "umg-is-tf"
  env    = "dev"
  aws = {
    region = "us-east-1"
  }
  vpc = {
    cidr    = "192.168.0.0/16"
    cidr_subnet1 = "192.168.0.0/24"
    cidr_subnet2 = "192.168.1.0/24"
  }
}
