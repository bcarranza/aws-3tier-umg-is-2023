# Crear bucket para flow log
resource "aws_s3_bucket" "this" {
  bucket = "${local.prefix}-vpc-flow-log"
  tags   = {
    Name        = "${local.prefix}-vpc-flow-log"
    Environment = local.env
    Path        = "${basename(abspath(path.module))}/00-s3-flow.tf"
  }
}