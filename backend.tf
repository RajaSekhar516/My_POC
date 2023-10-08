terraform {
  backend "s3" {
    bucket = "mypoc1"
    key = "main"
    region = "eu-north-1"
    dynamodb_table = "my-table"
  }
}
