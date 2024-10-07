variable "name" {}
variable "vpc_cidr_block" {}
variable "public_subnet" {
  type = map(string)
}
variable "private_subnet" {
  type = map(string)
}

variable "target_subnet" {
  default = "private_subnet"
}
variable "az" {}