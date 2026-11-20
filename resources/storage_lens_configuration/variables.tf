variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "config_id" {
  type        = string
  description = "(Required, Forces new resource) ID of the S3 Storage Lens configuration."
}

variable "account_id" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) AWS account ID for the configuration. Defaults to the account ID of the Terraform AWS provider."
}

variable "storage_lens_configuration" {
  type = object({
    account_level = object({
      activity_metrics = optional(object({
        enabled = optional(bool)
        # (Optional) Whether this setting is enabled.
      }))

      advanced_cost_optimization_metrics = optional(object({
        enabled = optional(bool)
        # (Optional) Whether this setting is enabled.
      }))

      advanced_data_protection_metrics = optional(object({
        enabled = optional(bool)
        # (Optional) Whether this setting is enabled.
      }))

      advanced_performance_metrics = optional(object({
        enabled = optional(bool)
        # (Optional) Whether this setting is enabled.
      }))

      bucket_level = object({
        activity_metrics = optional(object({
          enabled = optional(bool)
          # (Optional) Whether this setting is enabled.
        }))

        advanced_cost_optimization_metrics = optional(object({
          enabled = optional(bool)
          # (Optional) Whether this setting is enabled.
        }))

        advanced_data_protection_metrics = optional(object({
          enabled = optional(bool)
          # (Optional) Whether this setting is enabled.
        }))

        advanced_performance_metrics = optional(object({
          enabled = optional(bool)
          # (Optional) Whether this setting is enabled.
        }))

        detailed_status_code_metrics = optional(object({
          enabled = optional(bool)
          # (Optional) Whether this setting is enabled.
        }))

        prefix_level = optional(object({
          storage_metrics = object({
            enabled = optional(bool)
            # (Optional) Whether this setting is enabled.
            selection_criteria = optional(object({
              delimiter = optional(string)
              # (Optional) Delimiter used to select prefixes.
              max_depth = optional(number)
              # (Optional) Maximum prefix depth.
              min_storage_bytes_percentage = optional(number)
              # (Optional) Minimum storage bytes percentage. Valid values range from 1 to 100.
            }))
          })
        }))
      })

      detailed_status_code_metrics = optional(object({
        enabled = optional(bool)
        # (Optional) Whether this setting is enabled.
      }))
    })

    aws_org = optional(object({
      arn = string
      # (Required) ARN of the AWS organization.
    }))

    data_export = optional(object({
      cloud_watch_metrics = optional(object({
        enabled = bool
        # (Required) Whether this setting is enabled.
      }))

      s3_bucket_destination = optional(object({
        account_id = string
        # (Required) AWS account ID of the destination bucket owner.
        arn = string
        # (Required) ARN of the destination bucket.
        encryption = optional(object({
          sse_kms = optional(object({
            key_id = string
            # (Required) ARN of the KMS key.
          }))

          sse_s3 = optional(object({}))
          # (Optional) SSE-S3 encryption. Use an empty object.
        }))

        format = string
        # (Required) Export format. Valid values are CSV and Parquet.
        output_schema_version = string
        # (Required) Export schema version. The valid value is V_1.
        prefix = optional(string)
        # (Optional) Prefix where the metrics export is delivered.
      }))

      storage_lens_table_destination = optional(object({
        enabled = bool
        # (Required) Whether this setting is enabled.
        encryption = optional(object({
          sse_kms = optional(object({
            key_id = string
            # (Required) ARN of the KMS key.
          }))

          sse_s3 = optional(object({}))
          # (Optional) SSE-S3 encryption. Use an empty object.
        }))
      }))
    }))

    expanded_prefixes_data_export = optional(object({
      s3_bucket_destination = optional(object({
        account_id = string
        # (Required) AWS account ID of the destination bucket owner.
        arn = string
        # (Required) ARN of the destination bucket.
        encryption = optional(object({
          sse_kms = optional(object({
            key_id = string
            # (Required) ARN of the KMS key.
          }))

          sse_s3 = optional(object({}))
          # (Optional) SSE-S3 encryption. Use an empty object.
        }))

        format = string
        # (Required) Export format. Valid values are CSV and Parquet.
        output_schema_version = string
        # (Required) Export schema version. The valid value is V_1.
        prefix = optional(string)
        # (Optional) Prefix where the metrics export is delivered.
      }))

      storage_lens_table_destination = optional(object({
        enabled = bool
        # (Required) Whether this setting is enabled.
        encryption = optional(object({
          sse_kms = optional(object({
            key_id = string
            # (Required) ARN of the KMS key.
          }))

          sse_s3 = optional(object({}))
          # (Optional) SSE-S3 encryption. Use an empty object.
        }))
      }))
    }))

    enabled = bool
    # (Required) Whether this setting is enabled.
    exclude = optional(object({
      buckets = optional(set(string))
      # (Optional) Set of S3 bucket ARNs.
      regions = optional(set(string))
      # (Optional) Set of AWS Regions.
    }))

    include = optional(object({
      buckets = optional(set(string))
      # (Optional) Set of S3 bucket ARNs.
      regions = optional(set(string))
      # (Optional) Set of AWS Regions.
    }))

    prefix_delimiter = optional(string)
    # (Optional) Prefix delimiter used for object keys.
  })
  description = "(Required) S3 Storage Lens metrics, scope, and export configuration. Do not configure include and exclude together."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) A map of tags assigned to the Storage Lens configuration."
}
