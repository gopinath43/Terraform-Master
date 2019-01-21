
#Internet VPC
resource "aws_vpc" "main" {
    cidr_block = "10.65.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "main"
    }
}
	

# Subnets
resource "aws_subnet" "web" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.65.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-southeast-1a"

    tags {
        Name = "web"
    }
}
resource "aws_subnet" "app" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.65.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-southeast-1b"

    tags {
        Name = "app"
    }
}
resource "aws_subnet" "db" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.65.3.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "ap-southeast-1c"

    tags {
        Name = "db"
    }
}

# Internet GW
resource "aws_internet_gateway" "main-gw" {
    vpc_id = "${aws_vpc.main.id}"

    tags {
        Name = "main"
    }
}

# route tables
resource "aws_route_table" "main-public" {
    vpc_id = "${aws_vpc.main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.main-gw.id}"
    }

    tags {
        Name = "main-public-1"
    }
}

# route associations public
resource "aws_route_table_association" "main-web-a" {
    subnet_id = "${aws_subnet.web.id}"
    route_table_id = "${aws_route_table.main-public.id}"
}
resource "aws_route_table_association" "main-app-a" {
    subnet_id = "${aws_subnet.app.id}"
    route_table_id = "${aws_route_table.main-public.id}"
}

