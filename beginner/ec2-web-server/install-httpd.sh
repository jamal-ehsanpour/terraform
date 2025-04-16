#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>This Is My First Web Server Using Terrafom :) $(hostname -f)</h1>" | sudo tee /var/www/html/index.html
