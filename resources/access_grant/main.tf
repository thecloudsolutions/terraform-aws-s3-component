resource "aws_s3control_access_grant" "this" {
  region                    = var.region
  account_id                = var.account_id
  access_grants_location_id = var.access_grants_location_id
  permission                = var.permission
  s3_prefix_type            = var.s3_prefix_type

  dynamic "access_grants_location_configuration" {
    for_each = var.access_grants_location_configuration != null ? [var.access_grants_location_configuration] : []
    content {
      s3_sub_prefix = lookup(access_grants_location_configuration.value, "s3_sub_prefix", null)
    }
  }

  grantee {
    grantee_identifier = var.grantee.grantee_identifier
    grantee_type       = var.grantee.grantee_type
  }

  tags = var.tags
}
