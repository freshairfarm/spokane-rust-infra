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
