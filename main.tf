#AWS vpc resource 
resource "aws_vpc" "Web_VPC" {
  cidr_block = var.cidr_vpc

  enable_dns_support = true

  enable_dns_hostname = true 

  tags {
     Enviroment = var.enviroment_tags
 }

}

# aws internet gateway 

resource "aws_internet_gateway" "web_ig" {

vpc.id = var.aws_vpc.web_vpc

  tags {
     Enviroment = var.enviroment_tags
 }
}

# aws subnet for vpc

