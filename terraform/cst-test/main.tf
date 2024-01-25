module "securitytxt" {
  source      = "git@github.com:alphagov/terraform-aws-s3-static-website.git"

  providers = {
    aws.main         = aws.main
    aws.acm_provider = aws.acm_provider
  }

  website_domain_name = "security.staging.gds-cyber-security.digital"

  create_acm_certificate     = true
#  acm_certificate_arn_to_use = "arn:aws:acm:us-east-1:103495720024:certificate/7c66bd09-1f76-4b99-8dca-9489817d978d"

  name_prefix = "dev-cs"

  create_route53_hosted_zone = false
  route53_hosted_zone_id     = "Z2TPWWRT9N0BOM"


}
