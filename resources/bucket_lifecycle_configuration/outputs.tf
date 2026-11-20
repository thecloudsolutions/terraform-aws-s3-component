output "id" {
  value       = aws_s3_bucket_lifecycle_configuration.this.id
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided."
}

output "rules" {
  value       = [for rule in aws_s3_bucket_lifecycle_configuration.this.rule : { for key, value in rule : key => value if key != "prefix" }]
  description = "The lifecycle rules of the bucket, excluding the deprecated top-level prefix attribute."
}
