variable "region" {
  default = "us-east-1"
}

variable "project" {
  default = "secops"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  description = "Optional SSH key"
  default     = null
}
