resource "aws_s3_bucket" "bucket" {
  bucket        = var.bucket_name
  force_destroy = "true"
}


resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "bucket" {
  bucket = aws_s3_bucket.bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}
resource "aws_s3_bucket_policy" "frontbucket" {
  bucket = aws_s3_bucket.bucket.id
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
     {
        "Sid": "PublicReadGetObject",
        "Effect": "Allow",
        "Principal": "*",
        "Action": [
          "s3:GetObject"
        ],
        "Resource": [
          "arn:aws:s3:::${aws_s3_bucket.bucket.id}/*"
        ]
     }
    ]
}
POLICY
}

locals {
  s3_origin_id = "bucket"
}
