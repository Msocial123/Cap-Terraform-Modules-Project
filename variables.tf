variable "region" {}
variable "ami" {}
variable "key_name" {}
variable "instance_name" {}
variable "reference_name" {}
variable "vpc_name" {}
variable "vpc_cidr" {}
variable "vpc_tenancy" { default = "default" }
variable "enable_public_ip" { type = bool }
variable "vpc_dns_support" { type = bool }