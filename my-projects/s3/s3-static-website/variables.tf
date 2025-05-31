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


variable "index_document" {
  description = "The index document for the S3 website"
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "The error document for the S3 website"
  type        = string
  default     = "error.html"
}