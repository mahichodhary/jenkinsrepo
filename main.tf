provider "aws" {
  profile = "default"
  region = "us-east-1"
}

resource "aws_vpc" "three-tier_vpc" {
  cidr_block = var.vpc_cidr
  region= "us-east-1"
}

resource "aws_subnet" "pub_sub_AZ1" {
    vpc_id=aws_vpc.three-tier_vpc.id
    cidr_block= var.pub_sub_AZ1_cidr
    availability_zone = "us-east-1a"
    tag={
        name= "pub_sub_AZ1"
    }
}
resource "aws_subnet" "pub_sub_AZ2" {
    vpc_id=aws_vpc.three-tier_vpc.id
    cidr_block= var.pub_sub_AZ2_cidr
    availability_zone = "us-east-1b"
    tag={
        name= "pub_sub_AZ2"
    }
}
variable "vpc_cidr" {
    type=string
    default ="10.0.0.0/16"
}

variable "pub_sub_AZ1_cidr" {
    type=string
    default =" 10.0.0.0/24"
}

variable "pub_sub_AZ2_cidr" {
    type=string
    default =" 10.0.1.0/24"
}
