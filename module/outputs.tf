output "access_grant_account_ids" {
  value       = { for key in keys(module.access_grant) : key => module.access_grant[key].account_id }
  description = "AWS account ID of the S3 Access Grants instance."
}

output "access_grant_arns" {
  value       = { for key in keys(module.access_grant) : key => module.access_grant[key].arn }
  description = "ARN of the S3 Access Grant."
}

output "access_grant_ids" {
  value       = { for key in keys(module.access_grant) : key => module.access_grant[key].access_grant_id }
  description = "Unique ID of the S3 Access Grant."
}

output "access_grant_scopes" {
  value       = { for key in keys(module.access_grant) : key => module.access_grant[key].grant_scope }
  description = "S3 scope covered by the access grant."
}

output "access_grant_resource_ids" {
  value       = { for key in keys(module.access_grant) : key => module.access_grant[key].id }
  description = "AWS account ID and access grant ID separated by a comma (,)."
}

output "access_grant_tags_all" {
  value       = { for key in keys(module.access_grant) : key => module.access_grant[key].tags_all }
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "access_grants_instance_account_ids" {
  value       = { for key in keys(module.access_grants_instance) : key => module.access_grants_instance[key].account_id }
  description = "AWS account ID of the S3 Access Grants instance."
}

output "access_grants_instance_arns" {
  value       = { for key in keys(module.access_grants_instance) : key => module.access_grants_instance[key].arn }
  description = "ARN of the S3 Access Grants instance."
}

output "access_grants_instance_ids" {
  value       = { for key in keys(module.access_grants_instance) : key => module.access_grants_instance[key].access_grants_instance_id }
  description = "Unique ID of the S3 Access Grants instance."
}

output "access_grants_instance_resource_ids" {
  value       = { for key in keys(module.access_grants_instance) : key => module.access_grants_instance[key].id }
  description = "AWS account ID used as the Terraform resource ID of the S3 Access Grants instance."
}

output "access_grants_instance_identity_center_application_arns" {
  value       = { for key in keys(module.access_grants_instance) : key => module.access_grants_instance[key].identity_center_application_arn }
  description = "ARN of the IAM Identity Center application associated with the S3 Access Grants instance."
}

output "access_grants_instance_regions" {
  value       = { for key in keys(module.access_grants_instance) : key => module.access_grants_instance[key].region }
  description = "AWS Region of the S3 Access Grants instance."
}

output "access_grants_instance_tags_all" {
  value       = { for key in keys(module.access_grants_instance) : key => module.access_grants_instance[key].tags_all }
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "access_grants_instance_resource_policy_ids" {
  value       = { for key in keys(module.access_grants_instance_resource_policy) : key => module.access_grants_instance_resource_policy[key].id }
  description = "AWS account ID used as the Terraform resource ID of the S3 Access Grants instance resource policy."
}

output "access_grants_location_account_ids" {
  value       = { for key in keys(module.access_grants_location) : key => module.access_grants_location[key].account_id }
  description = "AWS account ID of the S3 Access Grants instance."
}

output "access_grants_location_arns" {
  value       = { for key in keys(module.access_grants_location) : key => module.access_grants_location[key].arn }
  description = "ARN of the S3 Access Grants location."
}

output "access_grants_location_ids" {
  value       = { for key in keys(module.access_grants_location) : key => module.access_grants_location[key].access_grants_location_id }
  description = "Unique ID of the registered S3 Access Grants location."
}

output "access_grants_location_resource_ids" {
  value       = { for key in keys(module.access_grants_location) : key => module.access_grants_location[key].id }
  description = "AWS account ID and access grants location ID separated by a comma (,)."
}

output "access_grants_location_regions" {
  value       = { for key in keys(module.access_grants_location) : key => module.access_grants_location[key].region }
  description = "AWS Region of the S3 Access Grants location."
}

output "access_grants_location_tags_all" {
  value       = { for key in keys(module.access_grants_location) : key => module.access_grants_location[key].tags_all }
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "access_point_account_ids" {
  value       = { for access_point in keys(module.access_point) : access_point => module.access_point[access_point].account_id }
  description = "AWS account ID that owns the access point."
}

output "access_point_aliases" {
  value       = { for access_point in keys(module.access_point) : access_point => module.access_point[access_point].alias }
  description = "The alias of the access point."
}

output "access_point_arns" {
  value       = { for access_point in keys(module.access_point) : access_point => module.access_point[access_point].arn }
  description = "The ARN of the access point."
}

output "access_point_domain_names" {
  value       = { for access_point in keys(module.access_point) : access_point => module.access_point[access_point].domain_name }
  description = "The DNS domain name of the access point."
}

output "access_point_endpoints" {
  value       = { for access_point in keys(module.access_point) : access_point => module.access_point[access_point].endpoints }
  description = "The endpoints of the access point."
}

output "access_point_has_public_access_policies" {
  value       = { for access_point in keys(module.access_point) : access_point => module.access_point[access_point].has_public_access_policy }
  description = "Whether the access point has a policy that allows public access."
}

output "access_point_ids" {
  value       = { for access_point in keys(module.access_point) : access_point => module.access_point[access_point].id }
  description = "The AWS account ID and access point name separated by a colon (:), or the access point ARN for S3 on Outposts."
}

output "access_point_names" {
  value       = { for access_point in keys(module.access_point) : access_point => module.access_point[access_point].name }
  description = "Name of the access point."
}

output "access_point_network_origins" {
  value       = { for access_point in keys(module.access_point) : access_point => module.access_point[access_point].network_origin }
  description = "Whether the access point allows access from the Internet or a VPC."
}

output "access_point_regions" {
  value       = { for access_point in keys(module.access_point) : access_point => module.access_point[access_point].region }
  description = "AWS Region of the access point."
}

output "access_point_tags_all" {
  value       = { for access_point in keys(module.access_point) : access_point => module.access_point[access_point].tags_all }
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "access_point_policy_has_public_access_policies" {
  value       = { for policy in keys(module.access_point_policy) : policy => module.access_point_policy[policy].has_public_access_policy }
  description = "Whether the access point has a policy that allows public access."
}

output "access_point_policy_ids" {
  value       = { for policy in keys(module.access_point_policy) : policy => module.access_point_policy[policy].id }
  description = "The AWS account ID and access point name separated by a colon (:), or the access point ARN for S3 on Outposts."
}

output "bucket_id" {
  value       = var.bucket != null ? module.bucket[0].id : null
  description = "The name of the bucket."
}

output "bucket_arn" {
  value       = var.bucket != null ? module.bucket[0].arn : null
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
}

output "bucket_domain_name" {
  value       = var.bucket != null ? module.bucket[0].bucket_domain_name : null
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
}

output "bucket_regional_domain_name" {
  value       = var.bucket != null ? module.bucket[0].bucket_regional_domain_name : null
  description = "The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL."
}

output "bucket_namespace" {
  value       = var.bucket != null ? module.bucket[0].bucket_namespace : null
  description = "The namespace of the bucket."
}

output "bucket_hosted_zone_id" {
  value       = var.bucket != null ? module.bucket[0].hosted_zone_id : null
  description = "The Route 53 Hosted Zone ID for this bucket's region."
}

output "bucket_region" {
  value       = var.bucket != null ? module.bucket[0].region : null
  description = "The AWS region this bucket resides in."
}

output "bucket_tags_all" {
  value       = var.bucket != null ? module.bucket[0].tags_all : null
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "accelerate_configuration_id" {
  value       = var.bucket_accelerate_configuration != null ? module.bucket_accelerate_configuration[0].id : null
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided."
}

output "acl_id" {
  value       = var.bucket_acl != null ? module.bucket_acl[0].id : null
  description = "The bucket, expected_bucket_owner (if configured), and acl (if configured) separated by commas (,)."
}

output "cors_configuration_id" {
  value       = var.bucket_cors_configuration != null ? module.bucket_cors_configuration[0].id : null
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided."
}

output "intelligent_tiering_configuration_ids" {
  value       = { for intelligent_tiering in keys(module.bucket_intelligent_tiering_configuration) : intelligent_tiering => module.bucket_intelligent_tiering_configuration[intelligent_tiering].id }
  description = "The bucket and intelligent tiering configuration name separated by a colon (:)."
}

output "lifecycle_configuration_id" {
  value       = var.bucket_lifecycle_configuration != null ? module.bucket_lifecycle_configuration[0].id : null
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided."
}

output "lifecycle_configuration_rules" {
  value       = var.bucket_lifecycle_configuration != null ? module.bucket_lifecycle_configuration[0].rules : null
  description = "The lifecycle rules of the bucket, excluding the deprecated top-level prefix attribute."
}

output "logging_id" {
  value       = var.bucket_logging != null ? module.bucket_logging[0].id : null
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided."
}

output "metadata_configuration_table_bucket_arn" {
  value       = var.bucket_metadata_configuration != null ? module.bucket_metadata_configuration[0].table_bucket_arn : null
  description = "The ARN of the table bucket storing the metadata tables."
}

output "metadata_configuration_table_bucket_type" {
  value       = var.bucket_metadata_configuration != null ? module.bucket_metadata_configuration[0].table_bucket_type : null
  description = "The type of the table bucket storing the metadata tables."
}

output "metadata_configuration_table_namespace" {
  value       = var.bucket_metadata_configuration != null ? module.bucket_metadata_configuration[0].table_namespace : null
  description = "The namespace storing the metadata tables."
}

output "metadata_configuration_inventory_table_arn" {
  value       = var.bucket_metadata_configuration != null ? module.bucket_metadata_configuration[0].inventory_table_arn : null
  description = "The ARN of the inventory table."
}

output "metadata_configuration_inventory_table_name" {
  value       = var.bucket_metadata_configuration != null ? module.bucket_metadata_configuration[0].inventory_table_name : null
  description = "The name of the inventory table."
}

output "metadata_configuration_journal_table_arn" {
  value       = var.bucket_metadata_configuration != null ? module.bucket_metadata_configuration[0].journal_table_arn : null
  description = "The ARN of the journal table."
}

output "metadata_configuration_journal_table_name" {
  value       = var.bucket_metadata_configuration != null ? module.bucket_metadata_configuration[0].journal_table_name : null
  description = "The name of the journal table."
}

output "metric_ids" {
  value       = { for metric in keys(module.bucket_metric) : metric => module.bucket_metric[metric].id }
  description = "The bucket and metrics configuration name separated by a colon (:)."
}

output "notification_id" {
  value       = var.bucket_notification != null ? module.bucket_notification[0].id : null
  description = "The name of the bucket."
}

output "object_lock_configuration_id" {
  value       = var.bucket_object_lock_configuration != null ? module.bucket_object_lock_configuration[0].id : null
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided."
}

output "ownership_controls_id" {
  value       = var.bucket_ownership_controls != null ? module.bucket_ownership_controls[0].id : null
  description = "S3 Bucket name."
}

output "bucket_policy" {
  value       = var.bucket_policy != null ? module.bucket_policy[0].policy : null
  description = "The policy of the bucket."
}

output "public_access_block_id" {
  value       = var.bucket_public_access_block != null ? module.bucket_public_access_block[0].id : null
  description = "Name of the S3 bucket the configuration is attached to"
}

output "replication_configuration_id" {
  value       = var.bucket_replication_configuration != null ? module.bucket_replication_configuration[0].id : null
  description = "S3 source bucket name"
}

output "request_payment_configuration_id" {
  value       = var.bucket_request_payment_configuration != null ? module.bucket_request_payment_configuration[0].id : null
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided."
}

output "server_side_encryption_configuration_id" {
  value       = var.bucket_server_side_encryption_configuration != null ? module.bucket_server_side_encryption_configuration[0].id : null
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided."
}

output "versioning_id" {
  value       = var.bucket_versioning != null ? module.bucket_versioning[0].id : null
  description = "The name of the bucket."
}

output "versioning_status" {
  value       = var.bucket_versioning != null ? module.bucket_versioning[0].status : null
  description = "The versioning status of the bucket. Valid values: Enabled, Suspended, or Disabled."
}

output "website_configuration_id" {
  value       = var.bucket_website_configuration != null ? module.bucket_website_configuration[0].id : null
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided."
}

output "website_configuration_website_domain" {
  value       = var.bucket_website_configuration != null ? module.bucket_website_configuration[0].website_domain : null
  description = "Domain of the website endpoint. This is used to create Route 53 alias records."
}

output "website_configuration_website_endpoint" {
  value       = var.bucket_website_configuration != null ? module.bucket_website_configuration[0].website_endpoint : null
  description = "Website endpoint"
}

output "directory_bucket_id" {
  value       = var.directory_bucket != null ? module.directory_bucket[0].id : null
  description = "The name of the directory bucket."
}

output "directory_bucket_arn" {
  value       = var.directory_bucket != null ? module.directory_bucket[0].arn : null
  description = "The ARN of the directory bucket."
}

output "directory_bucket_region" {
  value       = var.directory_bucket != null ? module.directory_bucket[0].region : null
  description = "The AWS region this directory bucket resides in."
}

output "directory_bucket_tags_all" {
  value       = var.directory_bucket != null ? module.directory_bucket[0].tags_all : null
  description = "A map of tags assigned to the directory bucket, including those inherited from the provider default_tags configuration block."
}

output "multi_region_access_point_account_ids" {
  value       = { for access_point in keys(module.multi_region_access_point) : access_point => module.multi_region_access_point[access_point].account_id }
  description = "AWS account ID that owns the Multi-Region Access Point."
}

output "multi_region_access_point_aliases" {
  value       = { for access_point in keys(module.multi_region_access_point) : access_point => module.multi_region_access_point[access_point].alias }
  description = "Alias of the Multi-Region Access Point."
}

output "multi_region_access_point_arns" {
  value       = { for access_point in keys(module.multi_region_access_point) : access_point => module.multi_region_access_point[access_point].arn }
  description = "ARN of the Multi-Region Access Point."
}

output "multi_region_access_point_domain_names" {
  value       = { for access_point in keys(module.multi_region_access_point) : access_point => module.multi_region_access_point[access_point].domain_name }
  description = "DNS domain name of the Multi-Region Access Point."
}

output "multi_region_access_point_ids" {
  value       = { for access_point in keys(module.multi_region_access_point) : access_point => module.multi_region_access_point[access_point].id }
  description = "AWS account ID and Multi-Region Access Point name separated by a colon (:)."
}

output "multi_region_access_point_names" {
  value       = { for access_point in keys(module.multi_region_access_point) : access_point => module.multi_region_access_point[access_point].name }
  description = "Name of the Multi-Region Access Point."
}

output "multi_region_access_point_regions" {
  value       = { for access_point in keys(module.multi_region_access_point) : access_point => module.multi_region_access_point[access_point].regions }
  description = "Bucket names, bucket account IDs, and Regions associated with the Multi-Region Access Point."
}

output "multi_region_access_point_statuses" {
  value       = { for access_point in keys(module.multi_region_access_point) : access_point => module.multi_region_access_point[access_point].status }
  description = "Current status of the Multi-Region Access Point."
}

output "multi_region_access_point_policy_established_policies" {
  value       = { for access_point in keys(module.multi_region_access_point_policy) : access_point => module.multi_region_access_point_policy[access_point].established }
  description = "Last established policy for the Multi-Region Access Point."
}

output "multi_region_access_point_policy_ids" {
  value       = { for access_point in keys(module.multi_region_access_point_policy) : access_point => module.multi_region_access_point_policy[access_point].id }
  description = "AWS account ID and Multi-Region Access Point name separated by a colon (:)."
}

output "multi_region_access_point_policy_proposed_policies" {
  value       = { for access_point in keys(module.multi_region_access_point_policy) : access_point => module.multi_region_access_point_policy[access_point].proposed }
  description = "Proposed policy for the Multi-Region Access Point."
}

output "object_ids" {
  value       = { for object in keys(module.object) : object => module.object[object].id }
  description = "The bucket name and object key separated by a slash (/)."
}

output "object_keys" {
  value       = { for object in keys(module.object) : object => module.object[object].key }
  description = "The key of the object within the bucket."
}

output "object_arns" {
  value       = { for object in keys(module.object) : object => module.object[object].arn }
  description = "ARN of the object."
}

output "object_checksum_crc32" {
  value       = { for object in keys(module.object) : object => module.object[object].checksum_crc32 }
  description = "The base64-encoded, 32-bit CRC32 checksum of the object."
}

output "object_checksum_crc32c" {
  value       = { for object in keys(module.object) : object => module.object[object].checksum_crc32c }
  description = "The base64-encoded, 32-bit CRC32C checksum of the object."
}

output "object_checksum_crc64nvme" {
  value       = { for object in keys(module.object) : object => module.object[object].checksum_crc64nvme }
  description = "The base64-encoded, 64-bit CRC64NVME checksum of the object."
}

output "object_checksum_sha1" {
  value       = { for object in keys(module.object) : object => module.object[object].checksum_sha1 }
  description = "The base64-encoded, 160-bit SHA-1 digest of the object."
}

output "object_checksum_sha256" {
  value       = { for object in keys(module.object) : object => module.object[object].checksum_sha256 }
  description = "The base64-encoded, 256-bit SHA-256 digest of the object."
}

output "object_etags" {
  value       = { for object in keys(module.object) : object => module.object[object].etag }
  description = "ETag generated for the object (an MD5 sum of the object content). For plaintext objects or objects encrypted with an AWS-managed key, the hash is an MD5 digest of the object data. For objects encrypted with a KMS key or objects created by either the Multipart Upload or Part Copy operation, the hash is not an MD5 digest, regardless of the method of encryption. More information on possible values can be found on Common Response Headers."
}

output "object_tags_all" {
  value       = { for object in keys(module.object) : object => module.object[object].tags_all }
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "object_version_ids" {
  value       = { for object in keys(module.object) : object => module.object[object].version_id }
  description = "Unique version ID value for the object, if bucket versioning is enabled."
}

output "storage_lens_configuration_arns" {
  value       = { for configuration in keys(module.storage_lens_configuration) : configuration => module.storage_lens_configuration[configuration].arn }
  description = "ARN of the S3 Storage Lens configuration."
}

output "storage_lens_configuration_ids" {
  value       = { for configuration in keys(module.storage_lens_configuration) : configuration => module.storage_lens_configuration[configuration].id }
  description = "AWS account ID and Storage Lens configuration ID separated by a colon."
}

output "storage_lens_configuration_tags_all" {
  value       = { for configuration in keys(module.storage_lens_configuration) : configuration => module.storage_lens_configuration[configuration].tags_all }
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}
