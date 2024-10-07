variable "az" {
  default = ["ap-southeast-1a"]
}

variable "vpc_cdir_block" {}

variable "public_subnet" {
  type = map(string)
}

variable "private_subnet" {
  type = map(string)
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "volume_size" {}

variable "env" {}
variable "name" {}

