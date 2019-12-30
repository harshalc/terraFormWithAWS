variable "aws_access_key" {
    default = "YOUR_ACCESS_KEY"
}
variable "aws_secret_key" {
    default = "YOUR_SECRET_KEY"
}
variable "aws_key_path" {
    default = "/root/terraform-ansible/terraform"
}
variable "aws_key_name" {
    default = "harshal-dec-19"
}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "ap-south-1"
}

variable "amis" {
    description = "AMIs by region"
    default = {
        ap-south-1 = "ami-0ce933e2ae91880d3"
    }
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.1.0/24"
}

variable "instance_type" {
    default = "t2.micro"
}

