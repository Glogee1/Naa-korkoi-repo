# VPC
resource "aws_vpc" "Glo-VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true 
  
  tags = {
    Name = "Glo-VPC"
  }
}

# PUBLIC SUBNET 1
resource "aws_subnet" "GloPub-sub1" {
  vpc_id     = aws_vpc.Glo-VPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "GloPub-sub1"
  }
}

# PUBLIC SUBNET 2
resource "aws_subnet" "GloPub-sub2" {
  vpc_id     = aws_vpc.Glo-VPC.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "GloPub-sub2"
  }
}

# PRIVATE SUBNET 1
resource "aws_subnet" "GloPriv-sub1" {
  vpc_id     = aws_vpc.Glo-VPC.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "GloPriv-sub1"
  }
}

# PRIVATE SUBNET 2
resource "aws_subnet" "GloPriv-sub2" {
  vpc_id     = aws_vpc.Glo-VPC.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "GloPriv-sub2"
}
}

# PUBLIC ROUTE TABLE
resource "aws_route_table" "GloPub-route-table" {
  vpc_id = aws_vpc.Glo-VPC.id

  tags = {
    Name = " GloPub-route-table"
  }
}

# PRIVATE ROUTE TABLE
resource "aws_route_table" "GloPriv-route-table" {
  vpc_id = aws_vpc.Glo-VPC.id

  tags = {
    Name = "GloPriv-route-table"
  }
}

# ROUTE TABLE ASSOCIATION-PUBLIC-1
resource "aws_route_table_association" "GloPub-Rt-Ass-1" {
  subnet_id      = aws_subnet.GloPub-sub1.id
  route_table_id = aws_route_table.GloPub-route-table.id
}

# ROUTE TABLE ASSOCIATION-PUBLIC-2
resource "aws_route_table_association" "GloPub-Rt-Ass-2" {
  subnet_id      = aws_subnet.GloPub-sub2.id
  route_table_id = aws_route_table.GloPub-route-table.id
}

# ROUTE TABLE ASSOCIATION-PRIVATE-1
resource "aws_route_table_association" "GloPriv-Rt-Ass-1" {
  subnet_id      = aws_subnet.GloPriv-sub1.id
  route_table_id = aws_route_table.GloPriv-route-table.id
}

# ROUTE TABLE ASSOCIATION-PRIVATE-2
resource "aws_route_table_association" "GloPriv-Rt-Ass-2" {
  subnet_id      = aws_subnet.GloPriv-sub2.id
  route_table_id = aws_route_table.GloPriv-route-table.id
}

# INTERNET GATEWAY 
resource "aws_internet_gateway" "GloInt-Gate" {
  vpc_id = aws_vpc.Glo-VPC.id

  tags = {
    Name = "GloInt-Gate"
  }
}

#AWS_ ROUTE
resource "aws_route" "GloInt-Gate-Ass" {
  route_table_id            =aws_route_table.GloPub-route-table.id
  gateway_id                = aws_internet_gateway.GloInt-Gate.id
  destination_cidr_block    = "0.0.0.0/0"
}

# Variables 


