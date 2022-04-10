terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
}

# Create a VPC
resource "aws_vpc" "vpc-n1" {
  cidr_block = "192.168.5.0/24"
  tags = {
      "name" = "vpc-n1"
  }
}

# Web-Tier-Subnet
resource "aws_subnet" "subnet_web"{
  vpc_id = aws_vpc.vpc-n1.id
  cidr_block = "192.168.5.0/25"

  tags = {
    Name = "Web_Subnet"
  }
}

# App-Tier-Subnet
resource "aws_subnet" "subnet_app"{
  vpc_id = aws_vpc.vpc-n1.id
  cidr_block = "192.168.5.32/27"

  tags = {
    Name = "App_Subnet"
  }
}

# DB-Tier-Subnet
resource "aws_subnet" "subnet_db"{
  vpc_id = aws_vpc.vpc-n1.id
  cidr_block = "192.168.5.64/28"

  tags = {
    Name = "DB_Subnet"
  }
}
