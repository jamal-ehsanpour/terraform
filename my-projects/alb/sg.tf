resource "aws_security_group" "alb-sg" {
    name = "${var.project-name}-alb-sg"
    description = "Security group for ALB"

    tags ={
        Name = var.resource_names["alb-security-group"]
    }


}

resource "aws_vpc_security_group_ingress_rule" "alb-ingress-http" {
    security_group_id = aws_security_group.alb-sg.id
    description =  "HTTP from anywhere"

    cidr_ipv4 =  "0.0.0.0/0"
    from_port =  var.app-port
    to_port =  var.app-port
    ip_protocol = "tcp"


}


resource "aws_vpc_security_group_ingress_rule" "alb-ingress-https" {
    security_group_id = aws_security_group.alb-sg.id
    description =  "HTTPS from anywhere"

    cidr_ipv4 =  "0.0.0.0/0"
    from_port =  var.secure-port
    to_port =  var.secure-port
    ip_protocol = "tcp"

}

resource "aws_vpc_security_group_egress_rule" "alb-egress" {
    security_group_id = aws_security_group.alb-sg.id

    cidr_ipv4 =  "0.0.0.0/0"
    ip_protocol = "-1"

}


resource "aws_security_group" "ec2-sg" {
    name = "${var.project-name}-ec2-sg"
    description =  "Security group for EC2"

    tags = {
        Name = var.resource_names["ec2-security-group"]
    }
 
}

resource "aws_vpc_security_group_ingress_rule" "ec2-ingress" {
    security_group_id = aws_security_group.ec2-sg.id
    description =  "HTTP from ALB"

    from_port =  var.app-port
    to_port =  var.app-port
    ip_protocol = "tcp"
    referenced_security_group_id = aws_security_group.alb-sg.id

}

resource "aws_vpc_security_group_egress_rule" "ec2-egress" {
    security_group_id = aws_security_group.ec2-sg.id

    cidr_ipv4 = "0.0.0.0/0" 
    ip_protocol = "-1"

}
