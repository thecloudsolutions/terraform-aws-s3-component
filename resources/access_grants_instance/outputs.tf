output "account_id" {
  value       = aws_s3control_access_grants_instance.this.account_id
  description = "AWS account ID of the S3 Access Grants instance."
}

output "arn" {
  value       = aws_s3control_access_grants_instance.this.access_grants_instance_arn
  description = "ARN of the S3 Access Grants instance."
}

output "access_grants_instance_id" {
  value       = aws_s3control_access_grants_instance.this.access_grants_instance_id
  description = "Unique ID of the S3 Access Grants instance."
}

output "id" {
  value       = aws_s3control_access_grants_instance.this.id
  description = "AWS account ID used as the Terraform resource ID of the S3 Access Grants instance."
}

output "identity_center_application_arn" {
  value       = aws_s3control_access_grants_instance.this.identity_center_application_arn
  description = "ARN of the IAM Identity Center application associated with the S3 Access Grants instance."
}

output "region" {
  value       = aws_s3control_access_grants_instance.this.region
  description = "AWS Region of the S3 Access Grants instance."
}

output "tags_all" {
  value       = aws_s3control_access_grants_instance.this.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}
