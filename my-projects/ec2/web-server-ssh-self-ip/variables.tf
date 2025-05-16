variable "instance_type" {
  type        = string
  description = "The instance type"
  default     = "t2.micro"
}

variable "tags" {
  type        = map(string)
  description = "Tags that will be used for all the resources created through Terraform"
  default = {
    Name       = "Web-Server"
    ManagedBy  = "Terraform"
    Department = "Development"
  }
}

variable "sg-name" {
  type        = string
  description = "Security Group Name"
  default     = "web-sg"
}

variable "ssh-port" {
  type        = number
  description = "SSH port"
  default     = 22
}


variable "http-port" {
  type        = number
  description = "HTTP port"
  default     = 80
}

