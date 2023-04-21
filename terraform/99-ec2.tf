# Creating 1st EC2 instance in Application Subnet 1
resource "aws_instance" "subnet1" {
  ami                         = "ami-00c39f71452c08778" #AMAZON LINUX
  instance_type               = "t2.micro" #FREE TIER
  count                       = 1
  vpc_security_group_ids      = ["${aws_security_group.this.id}"]
  subnet_id                   = "${aws_subnet.application-subnet-1.id}"
  user_data                   = "${file("data.sh")}"
  tags = {
    Name        = "${local.prefix}-ec2-subnet-1"
    Environment = local.env
    Path        = "${basename(abspath(path.module))}/99-ec2.tf"
  }
  depends_on = [
    aws_security_group.this,
    aws_subnet.application-subnet-1
  ]
}

# Creating 1st EC2 instance in Application Subnet 2
resource "aws_instance" "subnet2" {
  ami                         = "ami-007855ac798b5175e"
  instance_type               = "t2.micro"
  count                       = 1
  vpc_security_group_ids      = ["${aws_security_group.this.id}"]
  subnet_id                   = "${aws_subnet.application-subnet-2.id}"
  user_data                   = "${file("data.sh")}"
  tags = {
    Name        = "${local.prefix}-ec2-subnet-2"
    Environment = local.env
    Path        = "${basename(abspath(path.module))}/99-ec2.tf"
  }
  depends_on = [
    aws_security_group.this,
    aws_subnet.application-subnet-2
  ]
}