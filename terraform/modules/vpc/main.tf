resource "aws_vpc" "vpc-1" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = false

  tags = var.common_tags
}

resource "aws_subnet" "public-subnet-1" {
  cidr_block        = var.public_subnet_1_cidr
  vpc_id            = aws_vpc.vpc-1.id
  availability_zone = "${var.region}a"

  tags = var.common_tags
}

resource "aws_subnet" "public-subnet-2" {
  cidr_block        = var.public_subnet_2_cidr
  vpc_id            = aws_vpc.vpc-1.id
  availability_zone = "${var.region}b"

  tags = var.common_tags
}

resource "aws_subnet" "private-subnet-1" {
  cidr_block        = var.private_subnet_1_cidr
  vpc_id            = aws_vpc.vpc-1.id
  availability_zone = "${var.region}a"

  tags = var.common_tags
}

resource "aws_subnet" "private-subnet-2" {
  cidr_block        = var.private_subnet_2_cidr
  vpc_id            = aws_vpc.vpc-1.id
  availability_zone = "${var.region}b"

  tags = var.common_tags
}

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc-1.id
  tags   = var.common_tags
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.vpc-1.id
  tags   = var.common_tags
}

resource "aws_route_table_association" "public-route-1-association" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id      = aws_subnet.public-subnet-1.id
}

resource "aws_route_table_association" "public-route-2-association" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id      = aws_subnet.public-subnet-2.id
}

resource "aws_route_table_association" "private-route-1-association" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id      = aws_subnet.private-subnet-1.id
}

resource "aws_route_table_association" "private-route-2-association" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id      = aws_subnet.private-subnet-2.id
}

resource "aws_eip" "nat-gw-eip" {
  vpc = true

  tags = var.common_tags

  depends_on = [
    aws_internet_gateway.internet-gateway
  ]
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat-gw-eip.id
  subnet_id     = aws_subnet.public-subnet-1.id

  tags = var.common_tags

  depends_on = [
    aws_eip.nat-gw-eip
  ]
}

resource "aws_route" "nat-gw-route" {
  route_table_id         = aws_route_table.private-route-table.id
  nat_gateway_id         = aws_nat_gateway.nat-gw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc-1.id
  tags   = var.common_tags
}

resource "aws_route" "public-internet-igw-route" {
  route_table_id         = aws_route_table.public-route-table.id
  gateway_id             = aws_internet_gateway.internet-gateway.id
  destination_cidr_block = "0.0.0.0/0"
}
