provider "aws" {
    region = "us-east-1" 
}
# 1. Create a vpc
resource "aws_vpc" "prod-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "production"
  }
  }

# 2. Creat Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.prod-vpc.id
}

# 3. Create Custom Route Table
resource "aws_route_table" "prod-rout-table" {
  vpc_id = aws_vpc.prod-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "prod"
  }
}

# 4. Creat a Subnet
resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.prod-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone =  "us-east-1a"

  tags = {
    Name = "prod-subnet"
  }
}

# 5. Assosiate  subnet with Rout Table
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.prod-rout-table.id
}

# 6. Create a Security Group to allow port 22,80,443
resource "aws_security_group" "allow-web" {
  name        = "allow-web"
  description = "Allow all inbound and outbond traffic"
  vpc_id      = aws_vpc.prod-vpc.id
  tags = {
    Name = "allow-web"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow-http" {
  security_group_id = aws_security_group.allow-web.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow-https" {
  security_group_id = aws_security_group.allow-web.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow-ssh" {
  security_group_id = aws_security_group.allow-web.id

  cidr_ipv4   = "${data.http.user-ip.response_body}/32"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_egress_rule" "allow-outbound" {
  security_group_id = aws_security_group.allow-web.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = -1
}

# 7. Create an ENI
resource "aws_network_interface" "web-server-nic" {
  subnet_id       = aws_subnet.subnet-1.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.allow-web.id]

}

# 8. Create a Elastic Public IP
resource "aws_eip" "one" {
  domain                    = "vpc"
  network_interface         = aws_network_interface.web-server-nic.id
  associate_with_private_ip = "10.0.1.50"
  depends_on = [ aws_internet_gateway.gw , aws_instance.web-server-instance ]
}

# 9. Create Linux server and Install/Enable httpd
resource "aws_instance" "web-server-instance" {
    ami = "ami-00a929b66ed6e0de6"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    key_name = "main-key"

    network_interface {
      device_index = 0
      network_interface_id = aws_network_interface.web-server-nic.id
    }
  
    user_data = "${file("install-httpd.sh")}"

  tags = {
    Name = "web-server"
  }
}

data "http" "user-ip" {
    url = "https://api.ipify.org"
  
}
