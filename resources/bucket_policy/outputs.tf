output "policy" {
  value       = aws_s3_bucket_policy.this.policy
  description = "The policy of the bucket."
}
