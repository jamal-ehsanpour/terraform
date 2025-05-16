resource "aws_instance" "web-server" {
  ami                    = data.aws_ami.current.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg.id]
  user_data              = file("install-httpd.sh")

  tags = var.tags
}

data "aws_ami" "current" {
  most_recent = true
  owners      = ["amazon"]
}