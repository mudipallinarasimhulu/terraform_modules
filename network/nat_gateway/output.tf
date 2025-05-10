output "aws_eip" {
    value = aws_eip.wp_eip.id 

} 

output "aws_nat_gateway" {
    value = aws_nat_gateway.wp_nat.id
}
