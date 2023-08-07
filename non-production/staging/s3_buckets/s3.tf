resource "aws_s3_bucket" "frontbucket" {
  bucket        = "${var.bucket_names}"
  force_destroy = "true"
}

resource "aws_s3_bucket" "ab_frontbucket" {
  bucket        = "${var.ab_bucket_name}"
  force_destroy = "true"
}

/*
resource "aws_s3_bucket" "assetsbucket" {
  bucket        = "${var.bucket_names_assets}"
  force_destroy = "true"
} 
*/

resource "aws_s3_bucket_acl" "frontbucket_bucket_acl" {
  bucket = aws_s3_bucket.frontbucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_acl" "ab_frontbucket_bucket_acl" {
  bucket = aws_s3_bucket.ab_frontbucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "frontbucket" {
  bucket = aws_s3_bucket.frontbucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

resource "aws_s3_bucket_website_configuration" "ab_frontbucket" {
  bucket = aws_s3_bucket.ab_frontbucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

resource "aws_s3_bucket_policy" "frontbucket" {  
  bucket = aws_s3_bucket.frontbucket.id
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
             "arn:aws:s3:::${aws_s3_bucket.frontbucket.id}/*"            
          ]        
      }    
    ]
}
POLICY
}

resource "aws_s3_bucket_policy" "ab_frontbucket" {  
  bucket = aws_s3_bucket.ab_frontbucket.id
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
             "arn:aws:s3:::${aws_s3_bucket.ab_frontbucket.id}/*"            
          ]        
      }    
    ]
}
POLICY
}



locals {
  s3_origin_id = "frontbucket"
}

#to-do
#data "aws_acm_certificate" "issued" {
  #domain   = var.domain_name
  #types       = ["AMAZON_ISSUED"]
  #statuses = ["ISSUED"]
  #most_recent = true
  #provider = aws.virginia
#}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = "${aws_s3_bucket.frontbucket.bucket_regional_domain_name}"
    origin_id   = "${local.s3_origin_id}"
  }

   origin {
          connection_attempts = 3
          connection_timeout  = 10
          domain_name         = "api.staging.centrae.com"
          origin_id           =  "Non-Production-1546516192.us-west-2.elb.amazonaws.com"

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

  aliases = ["staging.centrae.com"]



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
    Environment = "staging"

  }

  viewer_certificate {
    acm_certificate_arn = var.cert_name
    ssl_support_method = "sni-only"

  }
}

//AB Bucket Cloud Front

resource "aws_cloudfront_distribution" "ab_s3_distribution" {
  origin {
    domain_name = "${aws_s3_bucket.ab_frontbucket.bucket_regional_domain_name}"
    origin_id   = "${local.s3_origin_id}"
  }

   origin {
          connection_attempts = 3
          connection_timeout  = 10
          domain_name         = "api-test.staging.centrae.com"
          origin_id           =  "Non-Production-1546516192.us-west-2.elb.amazonaws.com"

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

  aliases = ["staging-test.ab.centrae.com"]



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
    Environment = "staging"

  }

  viewer_certificate {
    acm_certificate_arn = var.ab_cert_name
    ssl_support_method = "sni-only"

  }
}

