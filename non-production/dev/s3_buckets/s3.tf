resource "aws_s3_bucket" "bucket" {
  count         = "${length(var.bucket_names)}"
  bucket        = "${var.bucket_names[count.index]}"
  force_destroy = "true"
}

data "aws_s3_bucket" "selected" {
  bucket = "centrae-assessments-fe"
}

resource "aws_s3_bucket_website_configuration" "frontbucket" {
  bucket = data.aws_s3_bucket.selected.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

resource "aws_s3_bucket_policy" "frontbucket" {  
  bucket = data.aws_s3_bucket.selected.id
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
             "arn:aws:s3:::${data.aws_s3_bucket.selected.id}/*"            
          ]        
      }    
    ]
}
POLICY
}


resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = "${data.aws_s3_bucket.selected.bucket_regional_domain_name}"
    origin_id   = "${data.aws_s3_bucket.selected.id}"

    #   s3_origin_config {
    #     origin_access_identity = "origin-access-identity/cloudfront/ABCDEFG1234567"
    #   }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Some comment"
  default_root_object = "index.html"

  # logging_config {
  #   include_cookies = false
  #   bucket          = "mylogs.s3.amazonaws.com"
  #   prefix          = "myprefix"
  # }

  aliases = ["dev.centrae.com"]



  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${data.aws_s3_bucket.selected.id}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

custom_error_response {
  error_code = 404
  error_caching_min_ttl = 2
  response_code = 200
  response_page_path = "/index.html"
}


restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Environment = "development"
  }

  viewer_certificate {
    acm_certificate_arn = var.cert_name
    ssl_support_method = "sni-only"

  }
}