#AWS vpc resource 
resource "aws_vpc" "Web_VPC" {
  cidr_block = var.cidr_vpc
  enable_dns_support = true
  enable_dns_hostname = true 

  tags {
     Enviroment = var.enviroment_tags
}

