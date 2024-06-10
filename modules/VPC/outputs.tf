output "VPC_ID" {
    value = aws_vpc.cloudcamp_final_project_vpc.id
}
output "VPC_CIDR" {
    value = aws_vpc.cloudcamp_final_project_vpc.cidr_block
}

output "PUB_SUB1_ID" {
    value =  aws_subnet.pub_sub1.id
}
output "PUB_SUB2_ID" {
    value =  aws_subnet.pub_sub2.id
}
output "PRI_SUB3_ID" {
    value =  aws_subnet.private_sub3.id
}
output "PRI_SUB4_ID" {
    value =  aws_subnet.private_sub4.id
}

output "IGW_ID" {
    value = aws_internet_gateway.igw-cloudcamp-final-project.id
}

output "Region" {
    value = var.region
}