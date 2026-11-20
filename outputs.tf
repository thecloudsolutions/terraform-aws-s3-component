output "s3_access_grant_account_ids" {
  value       = { for key in keys(module.s3) : key => module.s3[key].access_grant_account_ids }
  description = "AWS account ID of the S3 Access Grants instance."
}

output "s3_access_grant_arns" {
  value       = { for key in keys(module.s3) : key => module.s3[key].access_grant_arns }
  description = "ARN of the S3 Access Grant."
}

output "s3_access_grant_ids" {
  value       = { for key in keys(module.s3) : key => module.s3[key].access_grant_ids }
  description = "Unique ID of the S3 Access Grant."
}

output "s3_access_grant_scopes" {
  value       = { for key in keys(module.s3) : key => module.s3[key].access_grant_scopes }
  description = "S3 scope covered by the access grant."
}

output "s3_access_grant_resource_ids" {
  value       = { for key in keys(module.s3) : key => module.s3[key].access_grant_resource_ids }
  description = "AWS account ID and access grant ID separated by a comma (,)."
}

output "s3_access_grant_tags_all" {
  value       = { for key in keys(module.s3) : key => module.s3[key].access_grant_tags_all }
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "s3_access_grants_instance_account_ids" {
  value       = { for key in keys(module.s3) : key => module.s3[key].access_grants_instance_account_ids }
  description = "AWS account ID of the S3 Access Grants instance."
}

output "s3_access_grants_instance_arns" {
  value       = { for key in keys(module.s3) : key => module.s3[key].access_grants_instance_arns }
  description = "ARN of the S3 Access Grants instance."
}

output "s3_access_grants_instance_ids" {
  value       = { for key in keys(module.s3) : key => module.s3[key].access_grants_instance_ids }
  description = "Unique ID of the S3 Access Grants instance."
}

output "s3_access_grants_instance_resource_ids" {
  value       = { for key in keys(module.s3) : key => module.s3[key].access_grants_instance_resource_ids }
  description = "AWS account ID used as the Terraform resource ID of the S3 Access Grants instance."
}

output "s3_access_grants_instance_identity_center_application_arns" {
  value       = { for key in keys(module.s3) : key => module.s3[key].access_grants_instance_identity_center_application_arns }
  description = "ARN of the IAM Identity Center application associated with the S3 Access Grants instance."
}

output "s3_access_grants_instance_regions" {
  value       = { for key in keys(module.s3) : key => module.s3[key].access_grants_instance_regions }
  description = "AWS Region of the S3 Access Grants instance."
}

output "s3_access_grants_instance_tags_all" {
  value       = { for key in keys(module.s3) : key => module.s3[key].access_grants_instance_tags_all }
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "s3_access_grants_instance_resource_policy_ids" {
  value       = { for key in keys(module.s3) : key => module.s3[key].access_grants_instance_resource_policy_ids }
  description = "AWS account ID used as the Terraform resource ID of the S3 Access Grants instance resource policy."
}

output "s3_access_grants_location_account_ids" {
  value       = { for key in keys(module.s3) : key => module.s3[key].access_grants_location_account_ids }
  description = "AWS account ID of the S3 Access Grants instance."
}

output "s3_access_grants_location_arns" {
  value       = { for key in keys(module.s3) : key => module.s3[key].access_grants_location_arns }
  description = "ARN of the S3 Access Grants location."
}

output "s3_access_grants_location_ids" {
  value       = { for key in keys(module.s3) : key => module.s3[key].access_grants_location_ids }
  description = "Unique ID of the registered S3 Access Grants location."
}

output "s3_access_grants_location_resource_ids" {
  value       = { for key in keys(module.s3) : key => module.s3[key].access_grants_location_resource_ids }
  description = "AWS account ID and access grants location ID separated by a comma (,)."
}

output "s3_access_grants_location_regions" {
  value       = { for key in keys(module.s3) : key => module.s3[key].access_grants_location_regions }
  description = "AWS Region of the S3 Access Grants location."
}

output "s3_access_grants_location_tags_all" {
  value       = { for key in keys(module.s3) : key => module.s3[key].access_grants_location_tags_all }
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "s3_access_point_account_ids" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].access_point_account_ids }
  description = "AWS account ID that owns the access point."
}

output "s3_access_point_aliases" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].access_point_aliases }
  description = "The alias of the access point."
}

output "s3_access_point_arns" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].access_point_arns }
  description = "The ARN of the access point."
}

output "s3_access_point_domain_names" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].access_point_domain_names }
  description = "The DNS domain name of the access point."
}

output "s3_access_point_endpoints" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].access_point_endpoints }
  description = "The endpoints of the access point."
}

output "s3_access_point_has_public_access_policies" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].access_point_has_public_access_policies }
  description = "Whether the access point has a policy that allows public access."
}

output "s3_access_point_ids" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].access_point_ids }
  description = "The AWS account ID and access point name separated by a colon (:), or the access point ARN for S3 on Outposts."
}

output "s3_access_point_names" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].access_point_names }
  description = "Name of the access point."
}

output "s3_access_point_network_origins" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].access_point_network_origins }
  description = "Whether the access point allows access from the Internet or a VPC."
}

output "s3_access_point_regions" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].access_point_regions }
  description = "AWS Region of the access point."
}

output "s3_access_point_tags_all" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].access_point_tags_all }
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "s3_access_point_policy_has_public_access_policies" {
  value       = { for policy in keys(module.s3) : policy => module.s3[policy].access_point_policy_has_public_access_policies }
  description = "Whether the access point has a policy that allows public access."
}

output "s3_access_point_policy_ids" {
  value       = { for policy in keys(module.s3) : policy => module.s3[policy].access_point_policy_ids }
  description = "The AWS account ID and access point name separated by a colon (:), or the access point ARN for S3 on Outposts."
}

output "s3_bucket_ids" {
  value       = { for bucket in keys(module.s3) : bucket => module.s3[bucket].bucket_id }
  description = "The name of the bucket."
}

output "s3_bucket_arns" {
  value       = { for bucket in keys(module.s3) : bucket => module.s3[bucket].bucket_arn }
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
}

output "s3_bucket_domain_names" {
  value       = { for bucket in keys(module.s3) : bucket => module.s3[bucket].bucket_domain_name }
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
}

output "s3_bucket_regional_domain_names" {
  value       = { for bucket in keys(module.s3) : bucket => module.s3[bucket].bucket_regional_domain_name }
  description = "The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL."
}

output "s3_bucket_namespaces" {
  value       = { for bucket in keys(module.s3) : bucket => module.s3[bucket].bucket_namespace }
  description = "The namespace of the bucket."
}

output "s3_bucket_hosted_zone_ids" {
  value       = { for bucket in keys(module.s3) : bucket => module.s3[bucket].bucket_hosted_zone_id }
  description = "The Route 53 Hosted Zone ID for this bucket's region."
}

output "s3_bucket_regions" {
  value       = { for bucket in keys(module.s3) : bucket => module.s3[bucket].bucket_region }
  description = "The AWS region this bucket resides in."
}

output "s3_bucket_tags_all" {
  value       = { for bucket in keys(module.s3) : bucket => module.s3[bucket].bucket_tags_all }
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "s3_accelerate_configuration_ids" {
  value       = { for accelerate_configuration in keys(module.s3) : accelerate_configuration => module.s3[accelerate_configuration].accelerate_configuration_id }
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided."
}

output "s3_acl_ids" {
  value       = { for acl in keys(module.s3) : acl => module.s3[acl].acl_id }
  description = "The bucket, expected_bucket_owner (if configured), and acl (if configured) separated by commas (,)."
}

output "s3_cors_configuration_ids" {
  value       = { for cors in keys(module.s3) : cors => module.s3[cors].cors_configuration_id }
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided."
}

output "s3_intelligent_tiering_configuration_ids" {
  value       = { for intelligent_tiering in keys(module.s3) : intelligent_tiering => module.s3[intelligent_tiering].intelligent_tiering_configuration_ids }
  description = "The bucket and intelligent tiering configuration name separated by a colon (:)."
}

output "s3_lifecycle_configuration_ids" {
  value       = { for lifecycle in keys(module.s3) : lifecycle => module.s3[lifecycle].lifecycle_configuration_id }
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided."
}

output "s3_lifecycle_configuration_rules" {
  value       = { for lifecycle in keys(module.s3) : lifecycle => module.s3[lifecycle].lifecycle_configuration_rules }
  description = "The lifecycle rules of the bucket, excluding the deprecated top-level prefix attribute."
}

output "s3_logging_ids" {
  value       = { for logging in keys(module.s3) : logging => module.s3[logging].logging_id }
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided."
}

output "s3_metadata_configuration_table_bucket_arns" {
  value       = { for metadata_configuration in keys(module.s3) : metadata_configuration => module.s3[metadata_configuration].metadata_configuration_table_bucket_arn }
  description = "The ARN of the table bucket storing the metadata tables."
}

output "s3_metadata_configuration_table_bucket_types" {
  value       = { for metadata_configuration in keys(module.s3) : metadata_configuration => module.s3[metadata_configuration].metadata_configuration_table_bucket_type }
  description = "The type of the table bucket storing the metadata tables."
}

output "s3_metadata_configuration_table_namespaces" {
  value       = { for metadata_configuration in keys(module.s3) : metadata_configuration => module.s3[metadata_configuration].metadata_configuration_table_namespace }
  description = "The namespace storing the metadata tables."
}

output "s3_metadata_configuration_inventory_table_arns" {
  value       = { for metadata_configuration in keys(module.s3) : metadata_configuration => module.s3[metadata_configuration].metadata_configuration_inventory_table_arn }
  description = "The ARN of the inventory table."
}

output "s3_metadata_configuration_inventory_table_names" {
  value       = { for metadata_configuration in keys(module.s3) : metadata_configuration => module.s3[metadata_configuration].metadata_configuration_inventory_table_name }
  description = "The name of the inventory table."
}

output "s3_metadata_configuration_journal_table_arns" {
  value       = { for metadata_configuration in keys(module.s3) : metadata_configuration => module.s3[metadata_configuration].metadata_configuration_journal_table_arn }
  description = "The ARN of the journal table."
}

output "s3_metadata_configuration_journal_table_names" {
  value       = { for metadata_configuration in keys(module.s3) : metadata_configuration => module.s3[metadata_configuration].metadata_configuration_journal_table_name }
  description = "The name of the journal table."
}

output "s3_metric_ids" {
  value       = { for metric in keys(module.s3) : metric => module.s3[metric].metric_ids }
  description = "The bucket and metrics configuration name separated by a colon (:)."
}

output "s3_notification_ids" {
  value       = { for notification in keys(module.s3) : notification => module.s3[notification].notification_id }
  description = "The name of the bucket."
}

output "s3_object_lock_configuration_ids" {
  value       = { for object_lock in keys(module.s3) : object_lock => module.s3[object_lock].object_lock_configuration_id }
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided."
}

output "s3_ownership_controls_ids" {
  value       = { for ownership in keys(module.s3) : ownership => module.s3[ownership].ownership_controls_id }
  description = "S3 Bucket name."
}

output "s3_bucket_policies" {
  value       = { for policy in keys(module.s3) : policy => module.s3[policy].bucket_policy }
  description = "The policy of the bucket."
}

output "s3_public_access_block_ids" {
  value       = { for public_access_block in keys(module.s3) : public_access_block => module.s3[public_access_block].public_access_block_id }
  description = "Name of the S3 bucket the configuration is attached to"
}

output "s3_replication_configuration_ids" {
  value       = { for replication in keys(module.s3) : replication => module.s3[replication].replication_configuration_id }
  description = "S3 source bucket name"
}

output "s3_request_payment_configuration_ids" {
  value       = { for request_payment_configuration in keys(module.s3) : request_payment_configuration => module.s3[request_payment_configuration].request_payment_configuration_id }
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided."
}

output "s3_server_side_encryption_configuration_ids" {
  value       = { for sse in keys(module.s3) : sse => module.s3[sse].server_side_encryption_configuration_id }
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided."
}

output "s3_versioning_ids" {
  value       = { for versioning in keys(module.s3) : versioning => module.s3[versioning].versioning_id }
  description = "The name of the bucket."
}

output "s3_versioning_statuses" {
  value       = { for versioning in keys(module.s3) : versioning => module.s3[versioning].versioning_status }
  description = "The versioning status of the bucket. Valid values: Enabled, Suspended, or Disabled."
}

output "s3_website_configuration_ids" {
  value       = { for website_configuration in keys(module.s3) : website_configuration => module.s3[website_configuration].website_configuration_id }
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided."
}

output "s3_website_configuration_website_domains" {
  value       = { for website_configuration in keys(module.s3) : website_configuration => module.s3[website_configuration].website_configuration_website_domain }
  description = "Domain of the website endpoint. This is used to create Route 53 alias records."
}

output "s3_website_configuration_website_endpoints" {
  value       = { for website_configuration in keys(module.s3) : website_configuration => module.s3[website_configuration].website_configuration_website_endpoint }
  description = "Website endpoint"
}

output "s3_directory_bucket_ids" {
  value       = { for directory_bucket in keys(module.s3) : directory_bucket => module.s3[directory_bucket].directory_bucket_id }
  description = "The name of the directory bucket."
}

output "s3_directory_bucket_arns" {
  value       = { for directory_bucket in keys(module.s3) : directory_bucket => module.s3[directory_bucket].directory_bucket_arn }
  description = "The ARN of the directory bucket."
}

output "s3_directory_bucket_regions" {
  value       = { for directory_bucket in keys(module.s3) : directory_bucket => module.s3[directory_bucket].directory_bucket_region }
  description = "The AWS region this directory bucket resides in."
}

output "s3_directory_bucket_tags_all" {
  value       = { for directory_bucket in keys(module.s3) : directory_bucket => module.s3[directory_bucket].directory_bucket_tags_all }
  description = "A map of tags assigned to the directory bucket, including those inherited from the provider default_tags configuration block."
}

output "s3_multi_region_access_point_account_ids" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].multi_region_access_point_account_ids }
  description = "AWS account ID that owns the Multi-Region Access Point."
}

output "s3_multi_region_access_point_aliases" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].multi_region_access_point_aliases }
  description = "Alias of the Multi-Region Access Point."
}

output "s3_multi_region_access_point_arns" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].multi_region_access_point_arns }
  description = "ARN of the Multi-Region Access Point."
}

output "s3_multi_region_access_point_domain_names" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].multi_region_access_point_domain_names }
  description = "DNS domain name of the Multi-Region Access Point."
}

output "s3_multi_region_access_point_ids" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].multi_region_access_point_ids }
  description = "AWS account ID and Multi-Region Access Point name separated by a colon (:)."
}

output "s3_multi_region_access_point_names" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].multi_region_access_point_names }
  description = "Name of the Multi-Region Access Point."
}

output "s3_multi_region_access_point_regions" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].multi_region_access_point_regions }
  description = "Bucket names, bucket account IDs, and Regions associated with the Multi-Region Access Point."
}

output "s3_multi_region_access_point_statuses" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].multi_region_access_point_statuses }
  description = "Current status of the Multi-Region Access Point."
}

output "s3_multi_region_access_point_policy_established_policies" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].multi_region_access_point_policy_established_policies }
  description = "Last established policy for the Multi-Region Access Point."
}

output "s3_multi_region_access_point_policy_ids" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].multi_region_access_point_policy_ids }
  description = "AWS account ID and Multi-Region Access Point name separated by a colon (:)."
}

output "s3_multi_region_access_point_policy_proposed_policies" {
  value       = { for access_point in keys(module.s3) : access_point => module.s3[access_point].multi_region_access_point_policy_proposed_policies }
  description = "Proposed policy for the Multi-Region Access Point."
}

output "s3_object_ids" {
  value       = { for object in keys(module.s3) : object => module.s3[object].object_ids }
  description = "The bucket name and object key separated by a slash (/)."
}

output "s3_object_keys" {
  value       = { for object in keys(module.s3) : object => module.s3[object].object_keys }
  description = "The key of the object within the bucket."
}

output "s3_object_arns" {
  value       = { for object in keys(module.s3) : object => module.s3[object].object_arns }
  description = "ARN of the object."
}

output "s3_object_checksums_crc32" {
  value       = { for object in keys(module.s3) : object => module.s3[object].object_checksum_crc32 }
  description = "The base64-encoded, 32-bit CRC32 checksum of the object."
}

output "s3_object_checksums_crc32c" {
  value       = { for object in keys(module.s3) : object => module.s3[object].object_checksum_crc32c }
  description = "The base64-encoded, 32-bit CRC32C checksum of the object."
}

output "s3_object_checksums_crc64nvme" {
  value       = { for object in keys(module.s3) : object => module.s3[object].object_checksum_crc64nvme }
  description = "The base64-encoded, 64-bit CRC64NVME checksum of the object."
}

output "s3_object_checksums_sha1" {
  value       = { for object in keys(module.s3) : object => module.s3[object].object_checksum_sha1 }
  description = "The base64-encoded, 160-bit SHA-1 digest of the object."
}

output "s3_object_checksums_sha256" {
  value       = { for object in keys(module.s3) : object => module.s3[object].object_checksum_sha256 }
  description = "The base64-encoded, 256-bit SHA-256 digest of the object."
}

output "s3_object_etags" {
  value       = { for object in keys(module.s3) : object => module.s3[object].object_etags }
  description = "ETag generated for the object (an MD5 sum of the object content). For plaintext objects or objects encrypted with an AWS-managed key, the hash is an MD5 digest of the object data. For objects encrypted with a KMS key or objects created by either the Multipart Upload or Part Copy operation, the hash is not an MD5 digest, regardless of the method of encryption. More information on possible values can be found on Common Response Headers."
}

output "s3_object_tags_all" {
  value       = { for object in keys(module.s3) : object => module.s3[object].object_tags_all }
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "s3_object_version_ids" {
  value       = { for object in keys(module.s3) : object => module.s3[object].object_version_ids }
  description = "Unique version ID value for the object, if bucket versioning is enabled."
}

output "s3_storage_lens_configuration_arns" {
  value       = { for configuration in keys(module.s3) : configuration => module.s3[configuration].storage_lens_configuration_arns }
  description = "ARN of the S3 Storage Lens configuration."
}

output "s3_storage_lens_configuration_ids" {
  value       = { for configuration in keys(module.s3) : configuration => module.s3[configuration].storage_lens_configuration_ids }
  description = "AWS account ID and Storage Lens configuration ID separated by a colon."
}

output "s3_storage_lens_configuration_tags_all" {
  value       = { for configuration in keys(module.s3) : configuration => module.s3[configuration].storage_lens_configuration_tags_all }
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}
