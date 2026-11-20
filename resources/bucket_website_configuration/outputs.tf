output "id" {
  value       = aws_s3_bucket_website_configuration.this.id
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided."
}

output "website_domain" {
  value       = aws_s3_bucket_website_configuration.this.website_domain
  description = "Domain of the website endpoint. This is used to create Route 53 alias records."
}

output "website_endpoint" {
  value       = aws_s3_bucket_website_configuration.this.website_endpoint
  description = "Website endpoint"
}
