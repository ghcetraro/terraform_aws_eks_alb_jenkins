locals {
  app_name_dashed = "${var.customer}-${var.environment}"
  #
  aws_profile = "${var.customer}-${var.environment}"
  #
  tags = {
    application_name = local.app_name_dashed
    environment      = var.environment
    provisioner      = "terraform"
  }
  #
  pvc = {
    name               = "jenkins-pvc"
    storage            = "100Gi"
    storage_class_name = " " # to fill 
    efs_driver         = " " # to fill 
    efs_id             = " " # to fill 
  }
  #
  dns = {
    public_zone_id = " " # to fill 
    public_name    = " " # to fill 
  }
  #
  acm_certificate_arn_public = " " # to fill 
  #
  eks = {
    endpoint                   = " " # to fill 
    certificate_authority_data = " " # to fill 
    id                         = " " # to fill 
    oidc_provider              = " " # to fill 
    oidc_provider_arn          = " " # to fill 
    oidc_issuer_url            = " " # to fill 
  }
}
#
