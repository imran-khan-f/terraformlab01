# To create vpc for us west 1
#Resource create VPC
resource "aws_vpc" "MyVPC-us-west-1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "MyVPC-us-west-1"
  }
}

#Resource create subent
resource "aws_subnet" "public-subnet01" {
  vpc_id                  = aws_vpc.MyVPC-us-west-1.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "public-subnet"
  }
}

#Resource for IGW
resource "aws_internet_gateway" "myIGW" {
  vpc_id = aws_vpc.MyVPC-us-west-1.id
}

#Resource for Route table
resource "aws_route_table" "myroute-table" {
  vpc_id = aws_vpc.MyVPC-us-west-1.id

  tags = {
    "Name" = "Myroute-table"
  }
}

#Resource for Route for internet 
resource "aws_route" "myroute" {
  route_table_id         = aws_route_table.myroute-table.id
  gateway_id             = aws_internet_gateway.myIGW.id
  destination_cidr_block = "0.0.0.0/0"
}

#Resource for Route table associate
resource "aws_route_table_association" "myroute-associate" {
  route_table_id = aws_route_table.myroute-table.id
  subnet_id      = aws_subnet.public-subnet01.id
}

#Resource for Security group
resource "aws_security_group" "mysecurity-group" {
  name        = "mySG"
  description = "security group"
  vpc_id      = aws_vpc.MyVPC-us-west-1.id

  ingress {
    description = "allow port 22 for ssh"
    to_port     = "22"
    from_port   = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/16"]
  }

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all IP and Ports Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "MySG"
  }
}
/*
# To create vpc for us west 2
resource "aws_vpc" "Myvpc-us-west-2" {
  cidr_block = "20.0.0.0/16"
  provider = aws.aws-us-west-2 # aws=provider which is in 01.terraform.tf file | aws-us-west-2=alias.
  tags = {
    Name = "Myvpc-us-west-2"
  }  
}
*/