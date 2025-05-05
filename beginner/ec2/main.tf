
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.recent.id
  instance_type = var.instance_type

  tags = {
    Name = var.name
  }
}


data "aws_ami" "recent" {
  most_recent = true
  owners = ["amazon"]
  
}
