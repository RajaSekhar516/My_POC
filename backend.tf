terraform {
  backend "s3" {
    bucket = "mypoc12"
    key = "main"
    region = "us-east-1"
    dynamodb_table = "my-table"
  }
}

