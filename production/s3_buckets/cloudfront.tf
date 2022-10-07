data "aws_acm_certificate" "cert_global" {
  domain = var.domain_name
  statuses = ["ISSUED"]
  provider = aws.virginia
}

data "aws_acm_certificate" "seagage_cert_global" {
  domain = var.seagage_domain_name
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
  
 origin {
          connection_attempts = 3
          connection_timeout  = 10
          domain_name         = "prod-api.centrae.com"
          origin_id           = "production-1288100872.us-west-2.elb.amazonaws.com"

          custom_origin_config {
              http_port                = 80
              https_port               = 443
              origin_keepalive_timeout = 5
              origin_protocol_policy   = "https-only"
              origin_read_timeout      = 30
              origin_ssl_protocols     = [
                  "TLSv1",
                  "TLSv1.1",
                  "TLSv1.2",
                ]
            }
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
    default_ttl            = 0
    max_ttl                = 0
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

resource "aws_cloudfront_distribution" "s3_distribution_seagage" {

  origin {
    domain_name = "${aws_s3_bucket.bucket.bucket_regional_domain_name}"
    origin_id   = "${local.s3_origin_id}"

    #   s3_origin_config {
    #     origin_access_identity = "origin-access-identity/cloudfront/ABCDEFG1234567"
    #   }

	
  }
  
 origin {
          connection_attempts = 3
          connection_timeout  = 10
          domain_name         = "prod-api.centrae.com"
          origin_id           = "production-1288100872.us-west-2.elb.amazonaws.com"

          custom_origin_config {
              http_port                = 80
              https_port               = 443
              origin_keepalive_timeout = 5
              origin_protocol_policy   = "https-only"
              origin_read_timeout      = 30
              origin_ssl_protocols     = [
                  "TLSv1",
                  "TLSv1.1",
                  "TLSv1.2",
                ]
            }
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

  aliases = [var.seagage_aliases_name]



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
    default_ttl            = 0
    max_ttl                = 0
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
    acm_certificate_arn = data.aws_acm_certificate.seagage_cert_global.arn
    ssl_support_method = "sni-only"

  }
}


