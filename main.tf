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
# create EC2 instances in multiple regions
resource "aws_instance" "Verginaia-aserver" {
  ami           = "ami-067d1e60475437da2"
  key_name = "raja"
  instance_type = "t2.micro"
  tags= {
    Name = "Verginaia-aserver"
  }
}
resource "aws_instance" "ohio-server" {
  ami           = "ami-036f5574583e16426"
  key_name = "raja"
  instance_type = "t2.micro"
  provider     = aws.usa
  tags= {
    Name = "ohio-server"
  }
}

