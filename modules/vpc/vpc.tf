
locals {
 
 tags = {
   Env  = "Dev"
   }
 }
resource "aws_vpc" "vpc-final-project" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
    Env=local.tags.Env
  }
}
resource "aws_internet_gateway" "final-gw" {
  vpc_id = aws_vpc.vpc-final-project.id

  tags = {
    Name = var.gw_name
  }
}

resource "aws_subnet" "subnet-final-project" {
  vpc_id     = aws_vpc.vpc-final-project.id
  cidr_block = var.subnet_cidr
  availability_zone= var.subnet_avb

  tags = {
    Name = var.subnet_name
  }
}

resource "aws_route_table" "final-2" {
  vpc_id = aws_vpc.vpc-final-project.id

  route {
    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.final-gw.id
  }
  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }

  tags = {
    Name = var.route_name
  }
}
resource "aws_route_table_association" "public_route_table" {
  subnet_id      = aws_subnet.subnet-final-project.id
  route_table_id = aws_route_table.final-2.id
}



resource "aws_subnet" "subnet-private-final-project" {
  vpc_id     = aws_vpc.vpc-final-project.id
  cidr_block = var.subnet_private_cidr
  availability_zone= var.subnet_avb

  tags = {
    Name = var.subnet_private_name
  }
}

resource "aws_route_table" "final_private_rt" {
  vpc_id = aws_vpc.vpc-final-project.id

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }

  tags = {
    Name = var.route_private_name
  }
}

resource "aws_nat_gateway" "private-nat" {
  subnet_id     = aws_subnet.subnet-private-final-project.id

  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_internet_gateway.final-gw]
}

resource "aws_route_table_association" "public_route_table" {
  subnet_id      = aws_subnet.subnet-private-final-project.id
  route_table_id = aws_route_table.final_private_rt.id
}
