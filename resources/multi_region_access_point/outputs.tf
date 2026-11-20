output "account_id" {
  value       = aws_s3control_multi_region_access_point.this.account_id
  description = "AWS account ID that owns the Multi-Region Access Point."
}

output "alias" {
  value       = aws_s3control_multi_region_access_point.this.alias
  description = "Alias of the Multi-Region Access Point."
}

output "arn" {
  value       = aws_s3control_multi_region_access_point.this.arn
  description = "ARN of the Multi-Region Access Point."
}

output "domain_name" {
  value       = aws_s3control_multi_region_access_point.this.domain_name
  description = "DNS domain name of the Multi-Region Access Point."
}

output "id" {
  value       = aws_s3control_multi_region_access_point.this.id
  description = "AWS account ID and Multi-Region Access Point name separated by a colon (:)."
}

output "name" {
  value       = aws_s3control_multi_region_access_point.this.name
  description = "Name of the Multi-Region Access Point."
}

output "regions" {
  value       = aws_s3control_multi_region_access_point.this.details[0].region
  description = "Bucket names, bucket account IDs, and Regions associated with the Multi-Region Access Point."
}

output "status" {
  value       = aws_s3control_multi_region_access_point.this.status
  description = "Current status of the Multi-Region Access Point."
}
