resource "aws_s3_bucket" "kosi-bucket9" {
  bucket = "kosi-bucket9"

  force_destroy       = true
  object_lock_enabled = true

  tags = {
    Name        = "main-back"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "kosi-versioning" {
  bucket = aws_s3_bucket.kosi-bucket9.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "kosi-bucket" {
  bucket = aws_s3_bucket.kosi-bucket9.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "kosi-bucket9-dynamodb-table" {
  name         = "kosi-bucket-db-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
} 