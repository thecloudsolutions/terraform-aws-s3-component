variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "bucket" {
  type        = string
  description = "(Required) Name of the source S3 bucket you want Amazon S3 to monitor."
}

variable "role" {
  type        = string
  description = "(Required) ARN of the IAM role for Amazon S3 to assume when replicating the objects."
}

variable "rule" {
  type = list(object({
    delete_marker_replication = optional(object({
      # (Optional) Whether delete markers are replicated. This argument is only valid with V2 replication configurations (i.e., when filter is used)
      status = string
      # (Required) Whether delete markers should be replicated. Either "Enabled" or "Disabled".
    }))

    destination = object({
      # (Required) Specifies the destination for the rule.
      access_control_translation = optional(object({
        # (Optional) Configuration block that specifies the overrides to use for object owners on replication. See below. Specify this only in a cross-account scenario (where source and destination bucket owners are not the same), and you want to change replica ownership to the AWS account that owns the destination bucket. If this is not specified in the replication configuration, the replicas are owned by same AWS account that owns the source object. Must be used in conjunction with account owner override configuration.
        owner = string
        # (Required) Specifies the replica ownership. For default and valid values, see PUT bucket replication in the Amazon S3 API Reference. Valid values: Destination.
      }))

      account = optional(string)
      # (Optional) Account ID to specify the replica ownership. Must be used in conjunction with access_control_translation override configuration.
      bucket = string
      # (Required) ARN of the bucket where you want Amazon S3 to store the results.)

      encryption_configuration = optional(object({
        # (Optional) Configuration block that provides information about encryption. See below. If source_selection_criteria is specified, you must specify this element.
        replica_kms_key_id = string
        # (Required) ID (Key ARN or Alias ARN) of the customer managed AWS KMS key stored in AWS Key Management Service (KMS) for the destination bucket.
      }))

      metrics = optional(object({
        # (Optional) Configuration block that specifies replication metrics-related settings enabling replication metrics and events.
        event_threshold = optional(object({
          # (Optional) Configuration block that specifies the time threshold for emitting the s3:Replication:OperationMissedThreshold event.
          minutes = number
          # (Required) Time in minutes. Valid values: 15.
        }))

        status = string
        # (Required) Status of the Destination Metrics. Either "Enabled" or "Disabled".
      }))

      replication_time = optional(object({
        # (Optional) Configuration block that specifies S3 Replication Time Control (S3 RTC), including whether S3 RTC is enabled and the time when all objects and operations on objects must be replicated. See below. Replication Time Control must be used in conjunction with metrics.
        status = string
        # (Required) Status of the Replication Time Control. Either "Enabled" or "Disabled".

        time = object({
          # (Required) Configuration block specifying the time by which replication should be complete for all objects and operations on objects. 
          minutes = number
          # Time in minutes. Valid values: 15
        })
      }))

      storage_class = optional(string)
      # (Optional) The storage class used to store the object. By default, Amazon S3 uses the storage class of the source object to create the object replica.
    })

    existing_object_replication = optional(object({
      # (Optional) Replicate existing objects in the source bucket according to the rule configurations.
      status = string
      # (Required) Whether the existing objects should be replicated. Either "Enabled" or "Disabled".
    }))

    filter = optional(object({
      # (Optional, Conflicts with prefix) Filter that identifies subset of objects to which the replication rule applies. See below. If not specified, the rule will default to using prefix.
      and = optional(object({
        # (Optional) Configuration block for specifying rule filters. This element is required only if you specify more than one filter. See and below for more details.
        prefix = optional(string)
        # (Optional) Object key name prefix that identifies subset of objects to which the rule applies. Must be less than or equal to 1024 characters in length.
        tags = optional(map(string))
        # (Optional, Required if prefix is configured) Map of tags (key and value pairs) that identifies a subset of objects to which the rule applies. The rule applies only to objects having all the tags in its tagset.
      }))

      prefix = optional(string)
      # (Optional) Object key name prefix that identifies subset of objects to which the rule applies. Must be less than or equal to 1024 characters in length.

      tag = optional(object({
        # (Optional) Configuration block for specifying a tag key and value.
        key = string
        # (Required) Name of the object key.
        value = string
        # (Required) Value of the tag.
      }))
    }))

    id = optional(string)
    # (Optional) Unique identifier for the rule. Must be less than or equal to 255 characters in length.
    prefix = optional(string)
    # (Optional, Conflicts with filter, Deprecated) Object key name prefix identifying one or more objects to which the rule applies. Must be less than or equal to 1024 characters in length. Defaults to an empty string ("") if filter is not specified.
    priority = optional(string)
    # (Optional) Priority associated with the rule. Priority should only be set if filter is configured. If not provided, defaults to 0. Priority must be unique between multiple rules.

    source_selection_criteria = optional(object({
      # (Optional) Specifies special object selection criteria
      replica_modifications = optional(object({
        # (Optional) Configuration block that you can specify for selections for modifications on replicas. Amazon S3 doesn't replicate replica modifications by default. In the latest version of replication configuration (when filter is specified), you can specify this element and set the status to Enabled to replicate modifications on replicas.
        status = string
        # (Required) Whether the existing objects should be replicated. Either "Enabled" or "Disabled".
      }))
      sse_kms_encrypted_objects = optional(object({
        # (Optional) Configuration block for filter information for the selection of Amazon S3 objects encrypted with AWS KMS. If specified, replica_kms_key_id in destination encryption_configuration must be specified as well.
        status = string
        # Required) Whether the existing objects should be replicated. Either "Enabled" or "Disabled".
      }))

    }))

    status = string
    # (Required) Status of the rule. Either "Enabled" or "Disabled". The rule is ignored if status is not "Enabled".
  }))

  description = "(Required) List of configuration blocks describing the rules managing the replication."
}

variable "token" {
  type        = string
  default     = null
  description = "(Optional) Token to allow replication to be enabled on an Object Lock-enabled bucket. You must contact AWS support for the bucket's Object Lock token."
}
