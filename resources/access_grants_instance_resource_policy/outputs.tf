output "id" {
  value       = aws_s3control_access_grants_instance_resource_policy.this.id
  description = "AWS account ID used as the Terraform resource ID of the S3 Access Grants instance resource policy."
}
