module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "2.15.0"
  count  = "${length(var.bucket_names)}"
  bucket = "${var.bucket_names[count.index]}"
}