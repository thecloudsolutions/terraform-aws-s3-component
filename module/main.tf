module "access_grant" {
  source = "../resources/access_grant"

  for_each = var.access_grants

  region                    = try(each.value.region, null) != null ? each.value.region : try(each.value.access_grants_location_id, null) == null && try(each.value.access_grants_location_custom_name, null) != null ? module.access_grants_location[each.value.access_grants_location_custom_name].region : null
  account_id                = try(each.value.account_id, null) != null ? each.value.account_id : try(each.value.access_grants_location_id, null) == null && try(each.value.access_grants_location_custom_name, null) != null ? module.access_grants_location[each.value.access_grants_location_custom_name].account_id : null
  access_grants_location_id = try(each.value.access_grants_location_id, null) != null ? each.value.access_grants_location_id : try(each.value.access_grants_location_custom_name, null) != null ? module.access_grants_location[each.value.access_grants_location_custom_name].access_grants_location_id : null

  access_grants_location_configuration = lookup(each.value, "access_grants_location_configuration", null)
  grantee                              = each.value.grantee
  permission                           = each.value.permission
  s3_prefix_type                       = lookup(each.value, "s3_prefix_type", null)

  tags = lookup(each.value, "tags", null)
}

module "access_grants_instance" {
  source = "../resources/access_grants_instance"

  for_each = var.access_grants_instances

  region              = lookup(each.value, "region", null)
  account_id          = lookup(each.value, "account_id", null)
  identity_center_arn = lookup(each.value, "identity_center_arn", null)

  tags = lookup(each.value, "tags", null)
}

module "access_grants_instance_resource_policy" {
  source = "../resources/access_grants_instance_resource_policy"

  for_each = var.access_grants_instance_resource_policies

  region     = try(each.value.region, null) != null ? each.value.region : try(each.value.access_grants_instance_custom_name, null) != null ? module.access_grants_instance[each.value.access_grants_instance_custom_name].region : null
  account_id = try(each.value.account_id, null) != null ? each.value.account_id : try(each.value.access_grants_instance_custom_name, null) != null ? module.access_grants_instance[each.value.access_grants_instance_custom_name].account_id : null
  policy     = each.value.policy

  depends_on = [module.access_grants_instance]
}

module "access_grants_location" {
  source = "../resources/access_grants_location"

  for_each = var.access_grants_locations

  region         = try(each.value.region, null) != null ? each.value.region : try(each.value.access_grants_instance_custom_name, null) != null ? module.access_grants_instance[each.value.access_grants_instance_custom_name].region : null
  account_id     = try(each.value.account_id, null) != null ? each.value.account_id : try(each.value.access_grants_instance_custom_name, null) != null ? module.access_grants_instance[each.value.access_grants_instance_custom_name].account_id : null
  iam_role_arn   = each.value.iam_role_arn
  location_scope = try(each.value.location_scope, null) != null ? each.value.location_scope : "s3://${module.bucket[0].id}/"

  tags = lookup(each.value, "tags", null)

  depends_on = [module.access_grants_instance]
}

module "access_point" {
  source = "../resources/access_point"

  for_each = var.access_points

  region = lookup(each.value, "region", null)
  bucket = try(each.value.bucket, null) != null ? each.value.bucket : var.bucket != null ? module.bucket[0].id : module.directory_bucket[0].id

  name                              = each.value.name
  account_id                        = lookup(each.value, "account_id", null)
  bucket_account_id                 = lookup(each.value, "bucket_account_id", null)
  policy                            = lookup(each.value, "policy", null)
  public_access_block_configuration = lookup(each.value, "public_access_block_configuration", null)
  vpc_configuration                 = lookup(each.value, "vpc_configuration", null)

  tags = lookup(each.value, "tags", null)
}

module "access_point_policy" {
  source = "../resources/access_point_policy"

  for_each = var.access_point_policies

  region           = lookup(each.value, "region", null)
  access_point_arn = try(each.value.access_point_arn, null) != null ? each.value.access_point_arn : try(each.value.access_point_custom_name, null) != null ? module.access_point[each.value.access_point_custom_name].arn : null
  policy           = each.value.policy
}

module "bucket" {
  source = "../resources/bucket"

  count = var.bucket != null ? 1 : 0

  region              = lookup(var.bucket, "region", null)
  bucket              = lookup(var.bucket, "bucket", null)
  bucket_namespace    = lookup(var.bucket, "bucket_namespace", null)
  bucket_prefix       = lookup(var.bucket, "bucket_prefix", null)
  force_destroy       = lookup(var.bucket, "force_destroy", null)
  object_lock_enabled = lookup(var.bucket, "object_lock_enabled", null)

  tags = lookup(var.bucket, "tags", null)
}

module "bucket_abac" {
  source = "../resources/bucket_abac"

  count = var.bucket_abac != null ? 1 : 0

  region = lookup(var.bucket_abac, "region", null)
  bucket = try(var.bucket_abac.bucket, null) != null ? var.bucket_abac.bucket : module.bucket[0].id

  expected_bucket_owner = lookup(var.bucket_abac, "expected_bucket_owner", null)
  abac_status           = var.bucket_abac.abac_status
}

module "bucket_accelerate_configuration" {
  source = "../resources/bucket_accelerate_configuration"

  count = var.bucket_accelerate_configuration != null ? 1 : 0

  region = lookup(var.bucket_accelerate_configuration, "region", null)
  bucket = try(var.bucket_accelerate_configuration.bucket, null) != null ? var.bucket_accelerate_configuration.bucket : module.bucket[0].id

  expected_bucket_owner = lookup(var.bucket_accelerate_configuration, "expected_bucket_owner", null)
  status                = var.bucket_accelerate_configuration.status
}

module "bucket_acl" {
  source = "../resources/bucket_acl"

  count = var.bucket_acl != null ? 1 : 0

  region = lookup(var.bucket_acl, "region", null)
  bucket = try(var.bucket_acl.bucket, null) != null ? var.bucket_acl.bucket : module.bucket[0].id

  access_control_policy = lookup(var.bucket_acl, "access_control_policy", null)
  acl                   = lookup(var.bucket_acl, "acl", null)
  expected_bucket_owner = lookup(var.bucket_acl, "expected_bucket_owner", null)

  depends_on = [module.bucket_ownership_controls]
}

module "bucket_analytics_configuration" {
  source = "../resources/bucket_analytics_configuration"

  count = var.bucket_analytics_configuration != null ? 1 : 0

  region = lookup(var.bucket_analytics_configuration, "region", null)
  bucket = try(var.bucket_analytics_configuration.bucket, null) != null ? var.bucket_analytics_configuration.bucket : module.bucket[0].id

  name                   = var.bucket_analytics_configuration.name
  filter                 = lookup(var.bucket_analytics_configuration, "filter", null)
  storage_class_analysis = lookup(var.bucket_analytics_configuration, "storage_class_analysis", null)
}

module "bucket_analytics_configurations" {
  source = "../resources/bucket_analytics_configuration"

  for_each = var.bucket_analytics_configurations

  region = lookup(each.value, "region", null)
  bucket = try(each.value.bucket, null) != null ? each.value.bucket : module.bucket[0].id

  name                   = each.value.name
  filter                 = lookup(each.value, "filter", null)
  storage_class_analysis = lookup(each.value, "storage_class_analysis", null)
}

module "bucket_cors_configuration" {
  source = "../resources/bucket_cors_configuration"

  count = var.bucket_cors_configuration != null ? 1 : 0

  region = lookup(var.bucket_cors_configuration, "region", null)
  bucket = try(var.bucket_cors_configuration.bucket, null) != null ? var.bucket_cors_configuration.bucket : module.bucket[0].id

  cors_rule             = var.bucket_cors_configuration.cors_rule
  expected_bucket_owner = lookup(var.bucket_cors_configuration, "expected_bucket_owner", null)
}

module "bucket_intelligent_tiering_configuration" {
  source = "../resources/bucket_intelligent_tiering_configuration"

  for_each = var.bucket_intelligent_tiering_configurations

  region = lookup(each.value, "region", null)
  bucket = try(each.value.bucket, null) != null ? each.value.bucket : module.bucket[0].id

  name    = each.value.name
  status  = lookup(each.value, "status", null)
  filter  = lookup(each.value, "filter", null)
  tiering = each.value.tiering
}

module "bucket_inventory" {
  source = "../resources/bucket_inventory"

  count = var.bucket_inventory != null ? 1 : 0

  region = lookup(var.bucket_inventory, "region", null)
  bucket = try(var.bucket_inventory.bucket, null) != null ? var.bucket_inventory.bucket : var.bucket != null ? module.bucket[0].id : module.directory_bucket[0].id

  name                     = var.bucket_inventory.name
  included_object_versions = var.bucket_inventory.included_object_versions
  schedule                 = var.bucket_inventory.schedule
  destination              = var.bucket_inventory.destination
  enabled                  = lookup(var.bucket_inventory, "enabled", null)
  filter                   = lookup(var.bucket_inventory, "filter", null)
  optional_fields          = lookup(var.bucket_inventory, "optional_fields", null)
}

module "bucket_inventories" {
  source = "../resources/bucket_inventory"

  for_each = var.bucket_inventories

  region = lookup(each.value, "region", null)
  bucket = try(each.value.bucket, null) != null ? each.value.bucket : var.bucket != null ? module.bucket[0].id : module.directory_bucket[0].id

  name                     = each.value.name
  included_object_versions = each.value.included_object_versions
  schedule                 = each.value.schedule
  destination              = each.value.destination
  enabled                  = lookup(each.value, "enabled", null)
  filter                   = lookup(each.value, "filter", null)
  optional_fields          = lookup(each.value, "optional_fields", null)
}

module "bucket_lifecycle_configuration" {
  source = "../resources/bucket_lifecycle_configuration"

  count = var.bucket_lifecycle_configuration != null ? 1 : 0

  region = lookup(var.bucket_lifecycle_configuration, "region", null)
  bucket = try(var.bucket_lifecycle_configuration.bucket, null) != null ? var.bucket_lifecycle_configuration.bucket : var.bucket != null ? module.bucket[0].id : module.directory_bucket[0].id

  rule                                   = var.bucket_lifecycle_configuration.rule
  expected_bucket_owner                  = lookup(var.bucket_lifecycle_configuration, "expected_bucket_owner", null)
  transition_default_minimum_object_size = lookup(var.bucket_lifecycle_configuration, "transition_default_minimum_object_size", null)

  timeouts = lookup(var.bucket_lifecycle_configuration, "timeouts", null)

  depends_on = [module.bucket_versioning, module.bucket_replication_configuration]
}

module "bucket_logging" {
  source = "../resources/bucket_logging"

  count = var.bucket_logging != null ? 1 : 0

  region = lookup(var.bucket_logging, "region", null)
  bucket = try(var.bucket_logging.bucket, null) != null ? var.bucket_logging.bucket : module.bucket[0].id

  expected_bucket_owner    = lookup(var.bucket_logging, "expected_bucket_owner", null)
  target_bucket            = var.bucket_logging.target_bucket
  target_grant             = lookup(var.bucket_logging, "target_grant", null)
  target_object_key_format = lookup(var.bucket_logging, "target_object_key_format", null)
  target_prefix            = var.bucket_logging.target_prefix
}

module "bucket_metadata_configuration" {
  source = "../resources/bucket_metadata_configuration"

  count = var.bucket_metadata_configuration != null ? 1 : 0

  region = lookup(var.bucket_metadata_configuration, "region", null)
  bucket = try(var.bucket_metadata_configuration.bucket, null) != null ? var.bucket_metadata_configuration.bucket : module.bucket[0].id

  expected_bucket_owner  = lookup(var.bucket_metadata_configuration, "expected_bucket_owner", null)
  metadata_configuration = var.bucket_metadata_configuration.metadata_configuration

  timeouts = lookup(var.bucket_metadata_configuration, "timeouts", null)
}

module "bucket_metric" {
  source = "../resources/bucket_metric"

  for_each = var.bucket_metrics

  region = lookup(each.value, "region", null)
  bucket = try(each.value.bucket, null) != null ? each.value.bucket : var.bucket != null ? module.bucket[0].id : module.directory_bucket[0].id

  name   = each.value.name
  filter = lookup(each.value, "filter", null)
}

module "bucket_notification" {
  source = "../resources/bucket_notification"

  count = var.bucket_notification != null ? 1 : 0

  region = lookup(var.bucket_notification, "region", null)
  bucket = try(var.bucket_notification.bucket, null) != null ? var.bucket_notification.bucket : module.bucket[0].id

  eventbridge     = lookup(var.bucket_notification, "eventbridge", null)
  lambda_function = lookup(var.bucket_notification, "lambda_function", null)
  queue           = lookup(var.bucket_notification, "queue", null)
  topic           = lookup(var.bucket_notification, "topic", null)
}

module "bucket_object_lock_configuration" {
  source = "../resources/bucket_object_lock_configuration"

  count = var.bucket_object_lock_configuration != null ? 1 : 0

  region = lookup(var.bucket_object_lock_configuration, "region", null)
  bucket = try(var.bucket_object_lock_configuration.bucket, null) != null ? var.bucket_object_lock_configuration.bucket : module.bucket[0].id

  object_lock_enabled   = lookup(var.bucket_object_lock_configuration, "object_lock_enabled", null)
  expected_bucket_owner = lookup(var.bucket_object_lock_configuration, "expected_bucket_owner", null)
  rule                  = lookup(var.bucket_object_lock_configuration, "rule", null)
  token                 = lookup(var.bucket_object_lock_configuration, "token", null)

  depends_on = [module.bucket_versioning]
}

module "bucket_ownership_controls" {
  source = "../resources/bucket_ownership_controls"

  count = var.bucket_ownership_controls != null ? 1 : 0

  region = lookup(var.bucket_ownership_controls, "region", null)
  bucket = try(var.bucket_ownership_controls.bucket, null) != null ? var.bucket_ownership_controls.bucket : module.bucket[0].id

  rule = var.bucket_ownership_controls.rule
}

module "bucket_policy" {
  source = "../resources/bucket_policy"

  count = var.bucket_policy != null ? 1 : 0

  region = lookup(var.bucket_policy, "region", null)
  bucket = try(var.bucket_policy.bucket, null) != null ? var.bucket_policy.bucket : var.bucket != null ? module.bucket[0].id : module.directory_bucket[0].id

  policy = var.bucket_policy.policy

  depends_on = [module.bucket_public_access_block]
}

module "bucket_public_access_block" {
  source = "../resources/bucket_public_access_block"

  count = var.bucket_public_access_block != null ? 1 : 0

  region = lookup(var.bucket_public_access_block, "region", null)
  bucket = try(var.bucket_public_access_block.bucket, null) != null ? var.bucket_public_access_block.bucket : module.bucket[0].id

  block_public_acls       = lookup(var.bucket_public_access_block, "block_public_acls", null)
  block_public_policy     = lookup(var.bucket_public_access_block, "block_public_policy", null)
  ignore_public_acls      = lookup(var.bucket_public_access_block, "ignore_public_acls", null)
  restrict_public_buckets = lookup(var.bucket_public_access_block, "restrict_public_buckets", null)
  skip_destroy            = lookup(var.bucket_public_access_block, "skip_destroy", null)
}

module "bucket_replication_configuration" {
  source = "../resources/bucket_replication_configuration"

  count = var.bucket_replication_configuration != null ? 1 : 0

  region = lookup(var.bucket_replication_configuration, "region", null)
  bucket = try(var.bucket_replication_configuration.bucket, null) != null ? var.bucket_replication_configuration.bucket : module.bucket[0].id

  role  = var.bucket_replication_configuration.role
  rule  = var.bucket_replication_configuration.rule
  token = lookup(var.bucket_replication_configuration, "token", null)

  depends_on = [module.bucket_versioning]
}

module "bucket_request_payment_configuration" {
  source = "../resources/bucket_request_payment_configuration"

  count = var.bucket_request_payment_configuration != null ? 1 : 0

  region = lookup(var.bucket_request_payment_configuration, "region", null)
  bucket = try(var.bucket_request_payment_configuration.bucket, null) != null ? var.bucket_request_payment_configuration.bucket : module.bucket[0].id

  expected_bucket_owner = lookup(var.bucket_request_payment_configuration, "expected_bucket_owner", null)
  payer                 = var.bucket_request_payment_configuration.payer
}

module "bucket_server_side_encryption_configuration" {
  source = "../resources/bucket_server_side_encryption_configuration"

  count = var.bucket_server_side_encryption_configuration != null ? 1 : 0

  region = lookup(var.bucket_server_side_encryption_configuration, "region", null)
  bucket = try(var.bucket_server_side_encryption_configuration.bucket, null) != null ? var.bucket_server_side_encryption_configuration.bucket : var.bucket != null ? module.bucket[0].id : module.directory_bucket[0].id

  rule                  = var.bucket_server_side_encryption_configuration.rule
  expected_bucket_owner = lookup(var.bucket_server_side_encryption_configuration, "expected_bucket_owner", null)
}

module "bucket_versioning" {
  source = "../resources/bucket_versioning"

  count = var.bucket_versioning != null ? 1 : 0

  region = lookup(var.bucket_versioning, "region", null)
  bucket = try(var.bucket_versioning.bucket, null) != null ? var.bucket_versioning.bucket : module.bucket[0].id

  versioning_configuration = var.bucket_versioning.versioning_configuration
  expected_bucket_owner    = lookup(var.bucket_versioning, "expected_bucket_owner", null)
  mfa                      = lookup(var.bucket_versioning, "mfa", null)
}

module "bucket_website_configuration" {
  source = "../resources/bucket_website_configuration"

  count = var.bucket_website_configuration != null ? 1 : 0

  region = lookup(var.bucket_website_configuration, "region", null)
  bucket = try(var.bucket_website_configuration.bucket, null) != null ? var.bucket_website_configuration.bucket : module.bucket[0].id

  error_document           = lookup(var.bucket_website_configuration, "error_document", null)
  expected_bucket_owner    = lookup(var.bucket_website_configuration, "expected_bucket_owner", null)
  index_document           = lookup(var.bucket_website_configuration, "index_document", null)
  redirect_all_requests_to = lookup(var.bucket_website_configuration, "redirect_all_requests_to", null)
  routing_rule             = lookup(var.bucket_website_configuration, "routing_rule", null)
  routing_rules            = lookup(var.bucket_website_configuration, "routing_rules", null)
}

module "directory_bucket" {
  source = "../resources/directory_bucket"

  count = var.directory_bucket != null ? 1 : 0

  region          = lookup(var.directory_bucket, "region", null)
  bucket          = var.directory_bucket.bucket
  data_redundancy = lookup(var.directory_bucket, "data_redundancy", null)
  force_destroy   = lookup(var.directory_bucket, "force_destroy", null)
  location        = var.directory_bucket.location
  type            = lookup(var.directory_bucket, "type", null)

  tags = lookup(var.directory_bucket, "tags", null)
}

module "directory_bucket_access_point_scope" {
  source = "../resources/directory_bucket_access_point_scope"

  for_each = var.directory_bucket_access_point_scopes

  region     = try(each.value.region, null) != null ? each.value.region : try(each.value.name, null) == null && try(each.value.access_point_custom_name, null) != null ? module.access_point[each.value.access_point_custom_name].region : null
  account_id = try(each.value.account_id, null) != null ? each.value.account_id : try(each.value.name, null) == null && try(each.value.access_point_custom_name, null) != null ? module.access_point[each.value.access_point_custom_name].account_id : null
  name       = try(each.value.name, null) != null ? each.value.name : try(each.value.access_point_custom_name, null) != null ? module.access_point[each.value.access_point_custom_name].name : null

  scope = each.value.scope
}

module "multi_region_access_point" {
  source = "../resources/multi_region_access_point"

  for_each = var.multi_region_access_points

  region     = lookup(each.value, "region", null)
  account_id = lookup(each.value, "account_id", null)

  details = merge(each.value.details,
    {
      region = [for region in each.value.details.region :
        merge(region,
          { bucket = try(region.bucket, null) != null ? region.bucket : module.bucket[0].id }
        )
      ]
    }
  )

  timeouts = lookup(each.value, "timeouts", null)
}

module "multi_region_access_point_policy" {
  source = "../resources/multi_region_access_point_policy"

  for_each = var.multi_region_access_point_policies

  region     = lookup(each.value, "region", null)
  account_id = try(each.value.account_id, null) != null ? each.value.account_id : try(each.value.details.name, null) == null && try(each.value.details.multi_region_access_point_custom_name, null) != null ? module.multi_region_access_point[each.value.details.multi_region_access_point_custom_name].account_id : null

  details = {
    name   = try(each.value.details.name, null) != null ? each.value.details.name : try(each.value.details.multi_region_access_point_custom_name, null) != null ? module.multi_region_access_point[each.value.details.multi_region_access_point_custom_name].name : null
    policy = each.value.details.policy
  }

  timeouts = lookup(each.value, "timeouts", null)
}

module "multi_region_access_point_routes" {
  source = "../resources/multi_region_access_point_routes"

  for_each = var.multi_region_access_point_routes

  region     = lookup(each.value, "region", null)
  account_id = try(each.value.account_id, null) != null ? each.value.account_id : try(each.value.mrap, null) == null && try(each.value.multi_region_access_point_custom_name, null) != null ? module.multi_region_access_point[each.value.multi_region_access_point_custom_name].account_id : null
  mrap       = try(each.value.mrap, null) != null ? each.value.mrap : try(each.value.multi_region_access_point_custom_name, null) != null ? module.multi_region_access_point[each.value.multi_region_access_point_custom_name].arn : null
  route      = each.value.route
}

module "object" {
  source = "../resources/object"

  for_each = var.objects

  region = lookup(each.value, "region", null)

  bucket = try(each.value.bucket, null) != null ? each.value.bucket : var.bucket != null ? module.bucket[0].id : module.directory_bucket[0].id

  key                           = each.value.key
  force_destroy                 = lookup(each.value, "force_destroy", null)
  acl                           = lookup(each.value, "acl", null)
  bucket_key_enabled            = lookup(each.value, "bucket_key_enabled", null)
  cache_control                 = lookup(each.value, "cache_control", null)
  checksum_algorithm            = lookup(each.value, "checksum_algorithm", null)
  content_base64                = lookup(each.value, "content_base64", null)
  content_disposition           = lookup(each.value, "content_disposition", null)
  content_encoding              = lookup(each.value, "content_encoding", null)
  content_language              = lookup(each.value, "content_language", null)
  content_type                  = lookup(each.value, "content_type", null)
  content                       = lookup(each.value, "content", null)
  etag                          = lookup(each.value, "etag", null)
  kms_key_id                    = lookup(each.value, "kms_key_id", null)
  metadata                      = lookup(each.value, "metadata", null)
  object_lock_legal_hold_status = lookup(each.value, "object_lock_legal_hold_status", null)
  object_lock_mode              = lookup(each.value, "object_lock_mode", null)
  object_lock_retain_until_date = lookup(each.value, "object_lock_retain_until_date", null)
  server_side_encryption        = lookup(each.value, "server_side_encryption", null)
  source_hash                   = lookup(each.value, "source_hash", null)
  source_to_file                = lookup(each.value, "source_to_file", null)
  storage_class                 = lookup(each.value, "storage_class", null)
  website_redirect              = lookup(each.value, "website_redirect", null)
  override_provider             = lookup(each.value, "override_provider", null)

  tags = lookup(each.value, "tags", null)

  depends_on = [module.bucket_versioning, module.bucket_server_side_encryption_configuration, module.bucket_object_lock_configuration]
}

module "storage_lens_configuration" {
  source = "../resources/storage_lens_configuration"

  for_each = var.storage_lens_configurations

  region     = lookup(each.value, "region", null)
  config_id  = each.value.config_id
  account_id = lookup(each.value, "account_id", null)

  storage_lens_configuration = merge(each.value.storage_lens_configuration,
    {
      data_export = try(each.value.storage_lens_configuration.data_export.s3_bucket_destination, null) != null ? merge(each.value.storage_lens_configuration.data_export,
        {
          s3_bucket_destination = merge(each.value.storage_lens_configuration.data_export.s3_bucket_destination,
            { arn = try(each.value.storage_lens_configuration.data_export.s3_bucket_destination.arn, null) != null ? each.value.storage_lens_configuration.data_export.s3_bucket_destination.arn : module.bucket[0].arn }
          )
        }
      ) : each.value.storage_lens_configuration.data_export

      expanded_prefixes_data_export = try(each.value.storage_lens_configuration.expanded_prefixes_data_export.s3_bucket_destination, null) != null ? merge(each.value.storage_lens_configuration.expanded_prefixes_data_export,
        {
          s3_bucket_destination = merge(each.value.storage_lens_configuration.expanded_prefixes_data_export.s3_bucket_destination,
            { arn = try(each.value.storage_lens_configuration.expanded_prefixes_data_export.s3_bucket_destination.arn, null) != null ? each.value.storage_lens_configuration.expanded_prefixes_data_export.s3_bucket_destination.arn : module.bucket[0].arn }
          )
        }
      ) : each.value.storage_lens_configuration.expanded_prefixes_data_export
    }
  )

  tags = lookup(each.value, "tags", null)
}
