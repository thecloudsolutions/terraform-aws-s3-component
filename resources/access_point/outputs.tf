output "account_id" {
  value       = aws_s3_access_point.this.account_id
  description = "AWS account ID that owns the access point."
}

output "alias" {
  value       = aws_s3_access_point.this.alias
  description = "The alias of the access point."
}

output "arn" {
  value       = aws_s3_access_point.this.arn
  description = "The ARN of the access point."
}

output "domain_name" {
  value       = aws_s3_access_point.this.domain_name
  description = "The DNS domain name of the access point."
}

output "endpoints" {
  value       = aws_s3_access_point.this.endpoints
  description = "The endpoints of the access point."
}

output "has_public_access_policy" {
  value       = aws_s3_access_point.this.has_public_access_policy
  description = "Whether the access point has a policy that allows public access."
}

output "id" {
  value       = aws_s3_access_point.this.id
  description = "The AWS account ID and access point name separated by a colon (:), or the access point ARN for S3 on Outposts."
}

output "name" {
  value       = aws_s3_access_point.this.name
  description = "Name of the access point."
}

output "network_origin" {
  value       = aws_s3_access_point.this.network_origin
  description = "Whether the access point allows access from the Internet or a VPC."
}

output "region" {
  value       = aws_s3_access_point.this.region
  description = "AWS Region of the access point."
}

output "tags_all" {
  value       = aws_s3_access_point.this.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}
