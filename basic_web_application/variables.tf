variable "region" {
  description = "Default region name in AWS"
  type        = string
  default     = "eu-west-1"
}

variable "access_token" {
  description = "Github access token"
  type        = string
  default     = null
}
