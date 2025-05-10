module "eip" {
    source = 
}
resouce "aws_eip" "wp_eip" {
    vpc_id = aws_vpc.wp_vpc.id
     tags {
    Enviroment = var.enviroment_tags
 }
}
resource "aws_nat_gateway" "wp_nat" {
    allcation_id = aws_eip.wp_eip.id 
    subnet_id = var.aws_subnet.wp_subnet.id
    tags {
         Enviroment = var.enviroment_tags
    }

    depends_on = [aws_internet_gateway.wp_ig ]
}
resource "aws_route_table" "wp_private_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.wp_nat.id
  }
}

resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.wp_private_rt.id
}
