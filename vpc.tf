# Create a VPC
resource "aws_vpc" "vpc1" {
  cidr_block = "10.0.0.0/16"
  tags       = { Name = " vpc1" }
}

# Create a Subnets
resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags                    = { Name = " Public_subnet" }
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "10.0.2.0/24"
  tags       = { Name = " Private_subnet" }

}

#create a internet gateway
resource "aws_internet_gateway" "vpc1_igw" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = "vpc1_igw"
  }
}

#create a routetable and associate subnet to routetable
resource "aws_route_table" "vpc1_routetable" {
  vpc_id = aws_vpc.vpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc1_igw.id

  }
}
resource "aws_route_table_association" "public-sub" {
  route_table_id = aws_route_table.vpc1_routetable.id
  subnet_id      = aws_subnet.public-subnet.id

}