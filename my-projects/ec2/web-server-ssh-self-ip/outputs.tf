output "pubic-ip" {
  value = aws_instance.web-server.public_ip
}