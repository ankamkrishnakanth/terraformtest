variable "access_key" {}
variable "secret_key" {}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "igw_name" {}
variable "region" {}
variable "env" {}
variable "public_subnets" {
    type = list
    default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}
variable "private_subnets" {
    type = list
    default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}
variable "public_cidrs" {
    type = list
    default = ["10.40.1.0/24", "10.40.2.0/24", "10.40.3.0/24", "10.40.4.0/24", "10.40.5.0/24", "10.40.6.0/24"]
}
variable "private_cidrs" {
    type = list
    default = ["10.40.10.0/24", "10.40.20.0/24", "10.40.30.0/24", "10.40.40.0/24", "10.40.50.0/24", "10.40.60.0/24"]
}

variable "amis" {
    description = "AMIs by region"
    default = {
        ap-south-1 = "ami-0756a1c858554433e" # ubuntu 20.04 LTS
		us-east-1 = "ami-09d56f8956ab235b3" # ubuntu 20.04 LTS
    } 
}