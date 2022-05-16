resource "aws_vpc" "myvpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name  = var.vpc_name
    owner = "krishnakanth"
    env   = "dev"

  }
}


resource "aws_internet_gateway" "vpc-igw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = var.igw_name
  }
}