variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "bucket" {
  type        = string
  description = "(Required) Name of the source S3 bucket you want Amazon S3 to monitor."
}

variable "expected_bucket_owner" {
  type        = string
  default     = null
  description = "(Optional, Deprecated) Account ID of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP 403 (Access Denied) error."
}

variable "transition_default_minimum_object_size" {
  type        = string
  default     = null
  description = "(Optional) Default minimum object size behavior applied to the lifecycle configuration. Valid values: all_storage_classes_128K, varies_by_storage_class. Custom object size filters take precedence over this setting."
}

variable "rule" {
  type = list(object({
    abort_incomplete_multipart_upload = optional(object({
      # (Optional) Configuration block that specifies the days since the initiation of an incomplete multipart upload that Amazon S3 will wait before permanently removing all parts of the upload.
      days_after_initiation = optional(number)
      # (Optional) Number of days after which Amazon S3 aborts an incomplete multipart upload.
    }))

    expiration = optional(object({
      # (Optional) Configuration block that specifies the expiration for the lifecycle of the object in the form of date, days and, whether the object has a delete marker.
      date = optional(string)
      # (Optional) Date the object is to be moved or deleted. Should be in RFC3339 format.
      days = optional(number)
      # (Optional) Lifetime, in days, of the objects that are subject to the rule. The value must be a non-zero positive integer.
      expired_object_delete_marker = optional(bool)
      # (Optional, Conflicts with date and days) Indicates whether Amazon S3 will remove a delete marker with no noncurrent versions. If set to true, the delete marker will be expired; if set to false the policy takes no action.
    }))

    filter = optional(object({
      # (Optional) Configuration block used to identify objects that a Lifecycle Rule applies to. See below. If not specified, the rule will default to using prefix.
      and = optional(object({
        # (Optional) Configuration block used to apply a logical AND to two or more predicates. See below. The Lifecycle Rule will apply to any object matching all the predicates configured inside the and block.
        object_size_greater_than = optional(number)
        # (Optional) Minimum object size to which the rule applies. Value must be at least 0 if specified.
        object_size_less_than = optional(number)
        # (Optional) Maximum object size to which the rule applies. Value must be at least 1 if specified.
        prefix = optional(string)
        # (Optional) Prefix identifying one or more objects to which the rule applies.
        tags = optional(map(string))
        # (Optional) Key-value map of object tags to which the rule applies.
      }))

      object_size_greater_than = optional(number)
      # (Optional) Minimum object size (in bytes) to which the rule applies. 
      object_size_less_than = optional(number)
      # (Optional) Maximum object size (in bytes) to which the rule applies.
      prefix = optional(string)
      # (Optional) Prefix identifying one or more objects to which the rule applies. Defaults to an empty string ("") if not specified.

      tag = optional(list(object({
        # (Optional) At most one tag key and value block. Use and.tags for multiple tags.
        key = string
        # (Required) Name of the object key.
        value = string
        # (Required) Value of the tag.
      })))
    }))

    id = string
    # (Required) Unique identifier for the rule. The value cannot be longer than 255 characters.

    prefix = optional(string)
    # (Optional, Deprecated) Object key prefix to which the rule applies. Use filter instead.

    noncurrent_version_expiration = optional(object({
      # (Optional) Configuration block that specifies when noncurrent object versions expire. 
      newer_noncurrent_versions = optional(number)
      # (Optional) Number of noncurrent versions Amazon S3 will retain. Must be a non-zero positive integer.
      noncurrent_days = number
      # (Required) Number of days an object is noncurrent before Amazon S3 can perform the associated action. Must be a positive integer.
    }))

    noncurrent_version_transition = optional(list(object({
      # (Optional) Set of configuration blocks that specify the transition rule for the lifecycle rule that describes when noncurrent objects transition to a specific storage class.
      newer_noncurrent_versions = optional(number)
      # (Optional) Number of noncurrent versions Amazon S3 will retain. Must be a non-zero positive integer.
      noncurrent_days = number
      # (Required) Number of days an object is noncurrent before Amazon S3 can perform the associated action. Must be at least 0.
      storage_class = string
      # (Required) Class of storage used to store the object. Valid Values: GLACIER, STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING, DEEP_ARCHIVE, GLACIER_IR.  
    })))

    status = string
    # (Required) Whether the rule is currently being applied. Valid values: Enabled or Disabled.

    transition = optional(list(object({
      # (Optional) Set of configuration blocks that specify when an Amazon S3 object transitions to a specified storage class.
      date = optional(string)
      # (Optional, Conflicts with days) Date objects are transitioned to the specified storage class. The date value must be in RFC3339 format and set to midnight UTC e.g. 2023-01-13T00:00:00Z.
      days = optional(number)
      # (Optional, Conflicts with date) Number of days after creation when objects are transitioned to the specified storage class. The value must be a positive integer. If both days and date are not specified, defaults to 0. Valid values depend on storage_class, see Transition objects using Amazon S3 Lifecycle for more details.
      storage_class = string
      # (Required) Class of storage used to store the object. Valid Values: GLACIER, STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING, DEEP_ARCHIVE, GLACIER_IR.
    })))
  }))
  description = "(Required) List of configuration blocks describing the lifecycle rules."
}

variable "timeouts" {
  type = object({
    create = optional(string)
    # (Optional) Timeout for lifecycle configuration creation. Defaults to 3 minutes.
    update = optional(string)
    # (Optional) Timeout for lifecycle configuration updates. Defaults to 3 minutes.
  })
  default     = null
  description = "(Optional) Configuration block for resource timeouts."
}
