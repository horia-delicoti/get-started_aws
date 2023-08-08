variable "region" {
  description = "Default region name in AWS"
  type        = string
  default     = "eu-west-1"
}

variable "instance_type" {
  description = "Default instance type in AWS"
  type        = string
  default     = "t2.micro"
}

variable "aws_ssh_public_key" {
  description = "SSH public key"
  type        = string
  default     = null
}

variable "aws_ssh_private_key" {
  description = "SSH private key"
  type        = string
  default     = null
}

variable "aws_key_pair_name" {
  description = "AWS ssh key pair name"
  type        = string
  default     = "aws_key_pair"
}
