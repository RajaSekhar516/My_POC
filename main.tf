provider "aws" {
  region      = "us-east-1"
  access_key  = "AKIAY5HZIULKXVW6RVXE"
  secret_key = "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"
}
provider "aws" {
  region =  "us-east-2"
  access_key  = "AKIAY5HZIULKXVW6RVXE"
  secret_key = "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"
  alias = "usa"
}
resource "aws_vpc" "main" {
  cidr_block = "172.31.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "main"
  }
}

#Create security group with firewall rules
resource "aws_security_group" "jenkins-sg" {
  name        = security_group
  description = "security group for Ec2 instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = security_group
  }
}
# create EC2 instances in multiple regions
resource "aws_instance" "Verginaia-aserver" {
  ami           = "ami-067d1e60475437da2"
  key_name = "raja"
  instance_type = "t2.micro"
  vpc_security_group_ids = 
  tags= {
    Name = "Verginaia-aserver"
  }
}
resource "aws_instance" "ohio-server" {
  ami           = "ami-036f5574583e16426"
  key_name = "raja"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.jenkins-sg.id]
  provider     = aws.usa
  tags= {
    Name = "ohio-server"
  }
}

