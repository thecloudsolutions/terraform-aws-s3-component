output "id" {
  value       = aws_s3_directory_bucket.this.bucket
  description = "The name of the directory bucket."
}

output "arn" {
  value       = aws_s3_directory_bucket.this.arn
  description = "The ARN of the directory bucket."
}

output "region" {
  value       = aws_s3_directory_bucket.this.region
  description = "The AWS region this directory bucket resides in."
}

output "tags_all" {
  value       = aws_s3_directory_bucket.this.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}
