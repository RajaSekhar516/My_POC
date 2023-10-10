terraform {
  backend "s3" {
    bucket = "tfstatebucket0"
    key = "main"
    region = "us-east-1"
    dynamodb_table = "my-table"
  }
}

