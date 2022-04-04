resource "aws_s3_bucket" "bucket" {
  count         = "${length(var.bucket_names)}"
  bucket        = "${var.bucket_names[count.index]}"
  force_destroy = "true"
}
