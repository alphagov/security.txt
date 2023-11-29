module "securitytxt" {
  source      = "git@github.com:alphagov/terraform-aws-s3-static-website.git"

  providers = {
    aws.main         = aws.main
    aws.acm_provider = aws.acm_provider
  }

  website_domain_name = "vdp.cabinetoffice.gov.uk"

  create_acm_certificate     = true

  name_prefix = "prod"

  create_route53_hosted_zone = false
  route53_hosted_zone_id     = "Z2TPWWRT9N0BOM"


}
