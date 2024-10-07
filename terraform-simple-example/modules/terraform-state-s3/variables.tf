variable "env" {}
variable "project" {}
variable "region" {}
variable "provisioned" {}
variable "aws_s3_state_bucket_name" {}
variable "state_table" {
  type = list(any)
}
variable "kms_name" {
  default = "alias/terraform-bucket-key"
}
