resource "aws_s3control_access_point_policy" "this" {
  region           = var.region
  access_point_arn = var.access_point_arn
  policy           = var.policy
}
