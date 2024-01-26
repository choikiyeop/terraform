resource "aws_s3_bucket" "cky-tfstate" {
  bucket = "cky-tfstate-bucket"
}

resource "aws_s3_bucket_versioning" "cky-tfstate-versioning" {
  bucket = aws_s3_bucket.cky-tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}
