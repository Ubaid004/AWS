
terraform {
	required_providers{
	aws = {
	  source = "hashicorp/aws"
	  version = ">= 2.13.0"
}
}
required_version = ">= 1.2.0"
}

provider "aws" {
	region = "ap-south-1"
	access_key = "AKIAYXVSCK6HQ7P2YU7Q"
  	secret_key = "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"
}

locals {
	instances = {"Aadil":"ami-000ed5810ea2ca0a0"}
}

resource "aws_instance" "instance" {

	for_each = local.instances
	ami = each.value
	instance_type = "t2.micro"
	tags = {
	      Name = each.key
}
}

