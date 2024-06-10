resource "aws_vpc" "cloudcamp_final_project_vpc" {
    cidr_block = var.vpc_cidr
    assign_generated_ipv6_cidr_block = true
    enable_dns_support = true
    enable_dns_hostnames = true
    instance_tenancy = "default"

    tags = {
        Name = "${var.project_name}-vpc-cloudcamp-final-project"
    }
}

## Now the internet gateway
resource "aws_internet_gateway" "igw-cloudcamp-final-project" {
    vpc_id = aws_vpc.cloudcamp_final_project_vpc.id

    tags = {
        Name = "${var.project_name}-igw-cloudcamp-final-project"
    }
}

#data source to get the aws region in us-east-1
data "aws_availability_zones" "aws_availability_zones" {}

# we create the public subnets

resource "aws_subnet" "pub_sub1" {
    vpc_id = aws_vpc.cloudcamp_final_project_vpc.id
    cidr_block = var.pub_sub1_cidr
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.aws_availability_zones.names[0]
    tags = {
        Name = "${var.project_name}-pub-sub1-cloudcamp-final-project"
    }
 }

    resource "aws_subnet" "pub_sub2" {
        vpc_id = aws_vpc.cloudcamp_final_project_vpc.id
        cidr_block = var.pub_sub2_cidr
        map_public_ip_on_launch = true
        availability_zone = data.aws_availability_zones.aws_availability_zones.names[1]
        tags = {
            Name = "${var.project_name}-pub-sub2-cloudcamp-final-project"
        }
    }


# we create the public route table for the public subnets
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.cloudcamp_final_project_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw-cloudcamp-final-project.id
    }
    tags = {
        Name = "${var.project_name}-public-route-table-cloudcamp-final-project"
    }
}

# Associate the public route table with the public subnets
resource "aws_route_table_association" "pub_rt_a" {
    subnet_id = aws_subnet.pub_sub1.id
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "pub_rt_b" {
    subnet_id = aws_subnet.pub_sub2.id
    route_table_id = aws_route_table.public_route_table.id
}


resource "aws_subnet" "private_sub3" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.pri_sub3_cidr
    availability_zone = data.aws_availability_zones.availability_zone.names[0]

    tags = {
        Name = "${var.project_name}-private-sub3-cloudcamp-final-project"
    }
}

resource "aws_subnet" "private_sub4" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.pri_sub4_cidr
    availability_zone = data.aws_availability_zones.availability_zone.names[1]

    tags = {
        Name = "${var.project_name}-private-sub4-cloudcamp-final-project"
    }
}