module "project1_vpc" {
  source = "../modules/vpc"

  name           = "${var.env}-${var.name}"
  vpc_cidr_block = var.vpc_cdir_block
  public_subnet  = var.public_subnet
  private_subnet = var.private_subnet
  az             = var.az
}

module "project1" {
  source = "../modules/ec2"

  vpc_id    = module.project1_vpc.vpc_id
  subnet_id = module.project1_vpc.private_subnet_id[0]
  lb_tg_arn = module.project1_vpc.lb_tg_arn

  name          = "${var.env}-${var.name}"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  volume_size   = var.volume_size
}