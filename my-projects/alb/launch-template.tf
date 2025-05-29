# Launch Template for EC2 instances
resource "aws_launch_template" "web_server" {
  name_prefix   = "${var.project-name}-"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = false
    security_groups            = [aws_security_group.ec2-sg.id]
  }

  user_data = file("${path.module}/user-data.sh")

  tag_specifications {
    resource_type = "instance"
    tags ={
        Name =  var.resource_names["launch-template"]
    }
  }
}
