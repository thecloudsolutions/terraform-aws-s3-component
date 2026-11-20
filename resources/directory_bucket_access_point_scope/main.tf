resource "aws_s3control_directory_bucket_access_point_scope" "this" {
  region     = var.region
  account_id = var.account_id
  name       = var.name

  scope {
    permissions = lookup(var.scope, "permissions", null)
    prefixes    = lookup(var.scope, "prefixes", null)
  }
}
