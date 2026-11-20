output "account_id" {
  value       = aws_s3control_access_grant.this.account_id
  description = "AWS account ID of the S3 Access Grants instance."
}

output "arn" {
  value       = aws_s3control_access_grant.this.access_grant_arn
  description = "ARN of the S3 Access Grant."
}

output "access_grant_id" {
  value       = aws_s3control_access_grant.this.access_grant_id
  description = "Unique ID of the S3 Access Grant."
}

output "grant_scope" {
  value       = aws_s3control_access_grant.this.grant_scope
  description = "S3 scope covered by the access grant."
}

output "id" {
  value       = aws_s3control_access_grant.this.id
  description = "AWS account ID and access grant ID separated by a comma (,)."
}

output "tags_all" {
  value       = aws_s3control_access_grant.this.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}
