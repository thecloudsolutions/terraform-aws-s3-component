output "established" {
  value       = aws_s3control_multi_region_access_point_policy.this.established
  description = "Last established policy for the Multi-Region Access Point."
}

output "id" {
  value       = aws_s3control_multi_region_access_point_policy.this.id
  description = "AWS account ID and Multi-Region Access Point name separated by a colon (:)."
}

output "proposed" {
  value       = aws_s3control_multi_region_access_point_policy.this.proposed
  description = "Proposed policy for the Multi-Region Access Point."
}
