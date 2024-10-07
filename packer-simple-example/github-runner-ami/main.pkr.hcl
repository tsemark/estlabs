packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "this" {
  ami_name      = "gh_runners_{{timestamp}}"
  instance_type = "t4g.xlarge"
  region        = "ap-east-1"
  ssh_username  = "ubuntu"
  source_ami    = "ami-0a1ff31c99777e87d"

  launch_block_device_mappings {
    device_name  = "/dev/sda1"
    volume_size  = 10
    volume_type  = "gp3"
  }

  tags = {
    "Name"       = "gh-runners-ami"
    "Created-by" = "Packer"
  }
}

build {
  sources = ["source.amazon-ebs.this"]

  provisioner "file" {
    source      = "provision.sh"
    destination = "/tmp/provision.sh"
  }
  provisioner "shell" {
    inline = [
      "chmod +x /tmp/provision.sh",
      "sudo sh -c /tmp/provision.sh"
    ]
  }
}