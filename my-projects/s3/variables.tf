variable "bucket_name" {
  description = "Name of the s3 bucket. Must be unique"
  type        = string
  default     = "jehsan-static-website"
}

variable "tags" {
  description = "Tags to set on the bucket"
  type        = map(string)
  default = {
    Terraform   = "True"
    Environment = "Dev"
  }
}