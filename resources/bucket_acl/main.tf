resource "aws_s3_bucket_acl" "this" {
  region                = var.region
  acl                   = var.acl
  bucket                = var.bucket
  expected_bucket_owner = var.expected_bucket_owner

  dynamic "access_control_policy" {
    for_each = var.access_control_policy != null ? [var.access_control_policy] : []
    content {
      dynamic "grant" {
        for_each = access_control_policy.value.grant
        content {
          permission = grant.value.permission

          grantee {
            type          = grant.value.grantee.type
            email_address = lookup(grant.value.grantee, "email_address", null)
            id            = lookup(grant.value.grantee, "id", null)
            uri           = lookup(grant.value.grantee, "uri", null)
          }
        }
      }

      owner {
        id           = access_control_policy.value.owner.id
        display_name = lookup(access_control_policy.value.owner, "display_name", null)
      }
    }
  }
}
