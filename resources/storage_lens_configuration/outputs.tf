output "arn" {
  value       = aws_s3control_storage_lens_configuration.this.arn
  description = "The ARN of the S3 Storage Lens configuration."
}

output "id" {
  value       = aws_s3control_storage_lens_configuration.this.id
  description = "The AWS account ID and configuration ID separated by a colon (:)."
}

output "tags_all" {
  value       = aws_s3control_storage_lens_configuration.this.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}
