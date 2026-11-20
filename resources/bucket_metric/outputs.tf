output "id" {
  value       = aws_s3_bucket_metric.this.id
  description = "The bucket and metrics configuration name separated by a colon (:)."
}
