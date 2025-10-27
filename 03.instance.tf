#Resource for instance
resource "aws_instance" "Myinstance-010" {
  #ami             = "ami-0d902a8756c37e690"
  ami           = var.aws-ec2-ami-id
  #ami           = data.aws_ami.amazon-ec2-ami.id
  key_name      = "1307-us-west-1"
  instance_type = "t2.micro"
  #instance_type = var.aws-ec2-01
  #count           = var.ec2-instance-count
  subnet_id       = aws_subnet.public-subnet01.id
  security_groups = [aws_security_group.mysecurity-group.id]
  user_data       = file("install-apache.sh")

  tags = {
    "Name" = "Myweb01"
    #"Name" = "web-${count.index}"
  }
}