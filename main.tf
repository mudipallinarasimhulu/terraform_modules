#AWS vpc resource 

resource "aws_vpc" "wp_vpc" {
 cidr_block = var.cidr_vpc
 enable_dns_support = true
 enable_dns_hostname = true 
 tags {
    Enviroment = var.enviroment_tags
 }
}

# aws internet gateway 

resource "aws_internet_gateway" "wp_ig" {
 vpc.id = aws_vpc.wp_vpc.id
 tags {
    Enviroment = var.enviroment_tags
  }
}

# aws subnet for web_vpc 

resource "aws_subnet" "wp_subnet" {
  vpc_id     = aws_vpc.wp_vpc.id
  cidr_block = var.cidr_subnet
  map_public_ip_on_launch = true  
  availability_zone = var.availability_zone
  tags = {
    Enviroment = var.enviroment_tags
  }
}

# Aws route table for public subnet 

resource "aws_route_table" "wp_route" {
 vpc_id = aws_vpc.wp_vpc.id
 route  { 
  cidr_block = var.cidr_route
   gateway_id = aws_internet_gateway.wp_ig.id
 }
 tags = {
   Enviroment = var.enviroment_tags
 }
}

# Aws route associations
resource "aws_route_associations" "wp_associtation" {
  subnet_id = aws_vpc.wp_vpc.id
  route_table_id = aws_route_table.wp_route.id
}

# aws nat gateway creation
