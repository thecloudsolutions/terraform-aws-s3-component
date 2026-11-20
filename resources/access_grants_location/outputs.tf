output "account_id" {
  value       = aws_s3control_access_grants_location.this.account_id
  description = "AWS account ID of the S3 Access Grants instance."
}

output "arn" {
  value       = aws_s3control_access_grants_location.this.access_grants_location_arn
  description = "ARN of the S3 Access Grants location."
}

output "access_grants_location_id" {
  value       = aws_s3control_access_grants_location.this.access_grants_location_id
  description = "Unique ID of the registered S3 Access Grants location."
}

output "id" {
  value       = aws_s3control_access_grants_location.this.id
  description = "AWS account ID and access grants location ID separated by a comma (,)."
}

output "region" {
  value       = aws_s3control_access_grants_location.this.region
  description = "AWS Region of the S3 Access Grants location."
}

output "tags_all" {
  value       = aws_s3control_access_grants_location.this.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}
