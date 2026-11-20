output "id" {
  value       = aws_s3_bucket_intelligent_tiering_configuration.this.id
  description = "The bucket and intelligent tiering configuration name separated by a colon (:)."
}
