output "id" {
  value       = aws_s3_bucket_versioning.this.id
  description = "The name of the bucket."
}

output "status" {
  value       = aws_s3_bucket_versioning.this.versioning_configuration[0].status
  description = "The versioning status of the bucket. Valid values: Enabled, Suspended, or Disabled."
}
