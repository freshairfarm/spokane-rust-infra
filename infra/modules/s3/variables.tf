## GLOBAL VARIABLES ##
variable "default_tags" {
  type        = map(string)
  description = "A map of tags to apply to all resources"
}

variable "name_prefix" {
  type        = string
  description = "A prefix to apply to all resource names"
}

## MODULE VARIABLES ##
variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
}
