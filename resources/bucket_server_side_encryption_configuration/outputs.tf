output "id" {
  value       = aws_s3_bucket_server_side_encryption_configuration.this.id
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided."
}
