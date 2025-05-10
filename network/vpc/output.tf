output "aws_vpc"  {
    value = aws_vpc.wp_vpc.id
}

output "aws_internet_gateway" {
    value = aws_internet_gateway.wp_ig.id
}

output "aws_route_table" {
    value = aws_route_table.wp_route.id
}
output "aws_subnet" {
    value = aws_subnet.wp_public_subnet.id
}