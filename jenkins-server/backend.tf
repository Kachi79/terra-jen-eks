terraform {
  backend "s3" {
    bucket         = "kamsi-bucket"
    key            = "main/S3/terraform.tfvars"
    region         = "eu-west-2"
    dynamodb_table = "kamsi-bucket-db-table"
    encrypt        = true
  }
}