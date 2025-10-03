variable "vpc_name" {}
variable "vpc_cidr" {}
variable "vpc_tenancy" { default = "default" }
variable "enable_dns" { type = bool }
variable "enable_public_ip" { type = bool }