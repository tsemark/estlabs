env            = "test"
name           = "project1"
vpc_cdir_block = "10.0.0.0/16"
public_subnet = {
  "ap-southeast-1a" = "10.0.1.0/24"
  #  "ap-southeast-1b" = "10.0.2.0/24"
}
private_subnet = {
  "ap-southeast-1a" = "10.0.4.0/24"
  #  "ap-southeast-1b" = "10.0.5.0/24"
}
instance_type = "t4g.micro"
ami_id        = "ami-0e37b4d777c05ea5c"
volume_size   = "20"