output "s3_bucket_name" {
  value = aws_s3_bucket.this.bucket
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "flow_log_id" {
  value = aws_flow_log.this.id
}

output "security_group_id" {
  value = aws_security_group.this.id
}

output "ec2_instance_ids" {
  value = [
    aws_instance.subnet1.*.id,
    aws_instance.subnet2.*.id
  ]
}
