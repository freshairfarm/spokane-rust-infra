locals {
  account_id  = "783764572028"
  aws_region  = "us-west-2"
  region_abrv = "usw2"
  environment = "dev"

  name_prefix = "${local.environment}-${local.region_abrv}"

  default_tags = {
    # These tags have no functional purpose, but are useful for tracking resources
    Environment = local.environment
    Maintainer  = "terraform"
    Provisioner = "terraform"
  }
}

module "static_objects" {
  source = "../../modules/s3"

  default_tags = local.default_tags
  name_prefix  = local.name_prefix
  bucket_name  = "spokanerust-static-objects"
}
