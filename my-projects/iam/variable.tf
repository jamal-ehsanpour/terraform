variable "names" {
    description = "List of IAM users to be created"
    default = []
}

variable "groups" {
    description = "Name of the group IAM users should be added to"
    type = string
    default = ""
}


variable "pgp_user" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form `keybase:username`. Used to encrypt password and access key."
  type        = string
  default     = ""
}

variable   "password_length" {
  description = "The length of the generated password"
  type        = number
  default     = 16
}


variable "tags" {
  description = "A map of tags to be added to resources."
  type        = map(string)
  default     = {}
}

variable "password_reset_required" {
  description = "Whether the user should be forced to reset the generated password on first login."
  type        = bool
  default     = true
}
