variable "region" {
    type = string
    default = "eu-central-1"
}

variable "project-name" {
    type = string 
    default = "Terra-projects"
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
  default = {
    Department   = "Engineering"
    ManagedBy    = "Terraform"
    Environment = "Dev"
  }
}

variable "resource_names" {
  description = "Map of resource-specific names for tags"
  type        = map(string)
  default = {
    alb         = "web-application-load-balancer"
    ec2         = "web-servers"
    alb-security-group = "alb-security-group"
    ec2-security-group = "ec2-security-group"
    target-group = "web-target-group"
    launch-template = "web-launch-template"
  }
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "app-port" {
    type = number
    default = 80
}

variable "secure-port" {
    type = number
    default = 443
}

variable "certificate-arn" {
  description = "ARN of the ACM certificate for HTTPS"
  type = string
  default = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
}

variable "instance-count" {
  description = "The number of desired intances to be included in ASG"
  type = string
  default = "2"  
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
  default = ["subnet-02f96759b97f10a32" , "subnet-024a48cff92af3594"]
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for EC2 instances"
  type        = list(string)
  default = null
}

variable "vpc_id" {
  description = "VPC ID where resources will be deployed"
  type = string
  default = "vpc-02346125916449ac7"
  
}