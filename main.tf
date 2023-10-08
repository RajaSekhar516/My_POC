provider "aws" {
  region = "var.aws_region"
}

# Create a EC2 instance
resource "aws_instance" " instance-server" {
  ami           = var.ami_id
  key_name = var.key_name
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.my-sg.id]
}

  tags = {
    Name = "my-ec2-instance-server"
  }

#Create security group with firewall rules

resource "aws_security_group" "my-sg" {
  name        = var.security_group
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
    Name = var.security_group
  }
}


# Create a aws S3 bucket
resource "aws_s3_bucket" "my-s3-bucket" {
  bucket_prefix = var.bucket_prefix
   versioning {
    enabled = var.versioning
  }
  
  tags = var.tags
}  
