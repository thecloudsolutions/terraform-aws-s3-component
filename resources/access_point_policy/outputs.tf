output "has_public_access_policy" {
  value       = aws_s3control_access_point_policy.this.has_public_access_policy
  description = "Whether the access point has a policy that allows public access."
}

output "id" {
  value       = aws_s3control_access_point_policy.this.id
  description = "The AWS account ID and access point name separated by a colon (:), or the access point ARN for S3 on Outposts."
}
