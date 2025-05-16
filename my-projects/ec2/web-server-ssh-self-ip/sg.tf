resource "aws_security_group" "sg" {
  name        = var.sg-name
  description = "Security Group allowing ssh from user ip and enabling http"

  tags = var.tags

}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.sg.id

  cidr_ipv4   = "${data.http.user-ip.response_body}/32"
  from_port   = var.ssh-port
  ip_protocol = "tcp"
  to_port     = var.ssh-port

}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = var.http-port
  ip_protocol = "tcp"
  to_port     = var.http-port

}

resource "aws_vpc_security_group_egress_rule" "outbound" {
  security_group_id = aws_security_group.sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = -1
}

data "http" "user-ip" {
  url = "https://api.ipify.org"
}