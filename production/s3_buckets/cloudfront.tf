data "aws_acm_certificate" "cert_global" {
  domain = var.domain_name
  statuses = ["ISSUED"]
  provider = aws.virginia
}
resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = "${aws_s3_bucket.bucket.bucket_regional_domain_name}"
    origin_id   = "${local.s3_origin_id}"

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

  aliases = [var.aliases_name]



  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${local.s3_origin_id}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
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

  tags = merge(var.tags)

  viewer_certificate {
    acm_certificate_arn = data.aws_acm_certificate.cert_global.arn
    ssl_support_method = "sni-only"

  }
}
