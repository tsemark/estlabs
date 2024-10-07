variable "name" {}
variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "vpc_id" {}
variable "lb_tg_arn" {}
variable "volume_size" {}


variable "ssh_whitelist" {
  description = "Whitelisted IP address for SSH Access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}