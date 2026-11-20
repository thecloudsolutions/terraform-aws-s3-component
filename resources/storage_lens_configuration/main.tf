resource "aws_s3control_storage_lens_configuration" "this" {
  region     = var.region
  config_id  = var.config_id
  account_id = var.account_id

  storage_lens_configuration {
    enabled          = var.storage_lens_configuration.enabled
    prefix_delimiter = lookup(var.storage_lens_configuration, "prefix_delimiter", null)

    account_level {
      dynamic "activity_metrics" {
        for_each = var.storage_lens_configuration.account_level.activity_metrics != null ? [var.storage_lens_configuration.account_level.activity_metrics] : []
        content {
          enabled = lookup(activity_metrics.value, "enabled", null)
        }
      }

      dynamic "advanced_cost_optimization_metrics" {
        for_each = var.storage_lens_configuration.account_level.advanced_cost_optimization_metrics != null ? [var.storage_lens_configuration.account_level.advanced_cost_optimization_metrics] : []
        content {
          enabled = lookup(advanced_cost_optimization_metrics.value, "enabled", null)
        }
      }

      dynamic "advanced_data_protection_metrics" {
        for_each = var.storage_lens_configuration.account_level.advanced_data_protection_metrics != null ? [var.storage_lens_configuration.account_level.advanced_data_protection_metrics] : []
        content {
          enabled = lookup(advanced_data_protection_metrics.value, "enabled", null)
        }
      }

      dynamic "advanced_performance_metrics" {
        for_each = var.storage_lens_configuration.account_level.advanced_performance_metrics != null ? [var.storage_lens_configuration.account_level.advanced_performance_metrics] : []
        content {
          enabled = lookup(advanced_performance_metrics.value, "enabled", null)
        }
      }

      bucket_level {
        dynamic "activity_metrics" {
          for_each = var.storage_lens_configuration.account_level.bucket_level.activity_metrics != null ? [var.storage_lens_configuration.account_level.bucket_level.activity_metrics] : []
          content {
            enabled = lookup(activity_metrics.value, "enabled", null)
          }
        }

        dynamic "advanced_cost_optimization_metrics" {
          for_each = var.storage_lens_configuration.account_level.bucket_level.advanced_cost_optimization_metrics != null ? [var.storage_lens_configuration.account_level.bucket_level.advanced_cost_optimization_metrics] : []
          content {
            enabled = lookup(advanced_cost_optimization_metrics.value, "enabled", null)
          }
        }

        dynamic "advanced_data_protection_metrics" {
          for_each = var.storage_lens_configuration.account_level.bucket_level.advanced_data_protection_metrics != null ? [var.storage_lens_configuration.account_level.bucket_level.advanced_data_protection_metrics] : []
          content {
            enabled = lookup(advanced_data_protection_metrics.value, "enabled", null)
          }
        }

        dynamic "advanced_performance_metrics" {
          for_each = var.storage_lens_configuration.account_level.bucket_level.advanced_performance_metrics != null ? [var.storage_lens_configuration.account_level.bucket_level.advanced_performance_metrics] : []
          content {
            enabled = lookup(advanced_performance_metrics.value, "enabled", null)
          }
        }

        dynamic "detailed_status_code_metrics" {
          for_each = var.storage_lens_configuration.account_level.bucket_level.detailed_status_code_metrics != null ? [var.storage_lens_configuration.account_level.bucket_level.detailed_status_code_metrics] : []
          content {
            enabled = lookup(detailed_status_code_metrics.value, "enabled", null)
          }
        }

        dynamic "prefix_level" {
          for_each = var.storage_lens_configuration.account_level.bucket_level.prefix_level != null ? [var.storage_lens_configuration.account_level.bucket_level.prefix_level] : []
          content {
            storage_metrics {
              enabled = lookup(prefix_level.value.storage_metrics, "enabled", null)

              dynamic "selection_criteria" {
                for_each = prefix_level.value.storage_metrics.selection_criteria != null ? [prefix_level.value.storage_metrics.selection_criteria] : []
                content {
                  delimiter                    = lookup(selection_criteria.value, "delimiter", null)
                  max_depth                    = lookup(selection_criteria.value, "max_depth", null)
                  min_storage_bytes_percentage = lookup(selection_criteria.value, "min_storage_bytes_percentage", null)
                }
              }
            }
          }
        }
      }

      dynamic "detailed_status_code_metrics" {
        for_each = var.storage_lens_configuration.account_level.detailed_status_code_metrics != null ? [var.storage_lens_configuration.account_level.detailed_status_code_metrics] : []
        content {
          enabled = lookup(detailed_status_code_metrics.value, "enabled", null)
        }
      }
    }

    dynamic "aws_org" {
      for_each = var.storage_lens_configuration.aws_org != null ? [var.storage_lens_configuration.aws_org] : []
      content {
        arn = aws_org.value.arn
      }
    }

    dynamic "data_export" {
      for_each = var.storage_lens_configuration.data_export != null ? [var.storage_lens_configuration.data_export] : []
      content {
        dynamic "cloud_watch_metrics" {
          for_each = data_export.value.cloud_watch_metrics != null ? [data_export.value.cloud_watch_metrics] : []
          content {
            enabled = cloud_watch_metrics.value.enabled
          }
        }

        dynamic "s3_bucket_destination" {
          for_each = data_export.value.s3_bucket_destination != null ? [data_export.value.s3_bucket_destination] : []
          content {
            account_id            = s3_bucket_destination.value.account_id
            arn                   = s3_bucket_destination.value.arn
            format                = s3_bucket_destination.value.format
            output_schema_version = s3_bucket_destination.value.output_schema_version
            prefix                = lookup(s3_bucket_destination.value, "prefix", null)

            dynamic "encryption" {
              for_each = s3_bucket_destination.value.encryption != null ? [s3_bucket_destination.value.encryption] : []
              content {
                dynamic "sse_kms" {
                  for_each = encryption.value.sse_kms != null ? [encryption.value.sse_kms] : []
                  content {
                    key_id = sse_kms.value.key_id
                  }
                }

                dynamic "sse_s3" {
                  for_each = encryption.value.sse_s3 != null ? [1] : []
                  content {}
                }
              }
            }
          }
        }

        dynamic "storage_lens_table_destination" {
          for_each = data_export.value.storage_lens_table_destination != null ? [data_export.value.storage_lens_table_destination] : []
          content {
            enabled = storage_lens_table_destination.value.enabled

            dynamic "encryption" {
              for_each = storage_lens_table_destination.value.encryption != null ? [storage_lens_table_destination.value.encryption] : []
              content {
                dynamic "sse_kms" {
                  for_each = encryption.value.sse_kms != null ? [encryption.value.sse_kms] : []
                  content {
                    key_id = sse_kms.value.key_id
                  }
                }

                dynamic "sse_s3" {
                  for_each = encryption.value.sse_s3 != null ? [1] : []
                  content {}
                }
              }
            }
          }
        }
      }
    }

    dynamic "expanded_prefixes_data_export" {
      for_each = var.storage_lens_configuration.expanded_prefixes_data_export != null ? [var.storage_lens_configuration.expanded_prefixes_data_export] : []
      content {
        dynamic "s3_bucket_destination" {
          for_each = expanded_prefixes_data_export.value.s3_bucket_destination != null ? [expanded_prefixes_data_export.value.s3_bucket_destination] : []
          content {
            account_id            = s3_bucket_destination.value.account_id
            arn                   = s3_bucket_destination.value.arn
            format                = s3_bucket_destination.value.format
            output_schema_version = s3_bucket_destination.value.output_schema_version
            prefix                = lookup(s3_bucket_destination.value, "prefix", null)

            dynamic "encryption" {
              for_each = s3_bucket_destination.value.encryption != null ? [s3_bucket_destination.value.encryption] : []
              content {
                dynamic "sse_kms" {
                  for_each = encryption.value.sse_kms != null ? [encryption.value.sse_kms] : []
                  content {
                    key_id = sse_kms.value.key_id
                  }
                }

                dynamic "sse_s3" {
                  for_each = encryption.value.sse_s3 != null ? [1] : []
                  content {}
                }
              }
            }
          }
        }

        dynamic "storage_lens_table_destination" {
          for_each = expanded_prefixes_data_export.value.storage_lens_table_destination != null ? [expanded_prefixes_data_export.value.storage_lens_table_destination] : []
          content {
            enabled = storage_lens_table_destination.value.enabled

            dynamic "encryption" {
              for_each = storage_lens_table_destination.value.encryption != null ? [storage_lens_table_destination.value.encryption] : []
              content {
                dynamic "sse_kms" {
                  for_each = encryption.value.sse_kms != null ? [encryption.value.sse_kms] : []
                  content {
                    key_id = sse_kms.value.key_id
                  }
                }

                dynamic "sse_s3" {
                  for_each = encryption.value.sse_s3 != null ? [1] : []
                  content {}
                }
              }
            }
          }
        }
      }
    }

    dynamic "exclude" {
      for_each = var.storage_lens_configuration.exclude != null ? [var.storage_lens_configuration.exclude] : []
      content {
        buckets = lookup(exclude.value, "buckets", null)
        regions = lookup(exclude.value, "regions", null)
      }
    }

    dynamic "include" {
      for_each = var.storage_lens_configuration.include != null ? [var.storage_lens_configuration.include] : []
      content {
        buckets = lookup(include.value, "buckets", null)
        regions = lookup(include.value, "regions", null)
      }
    }
  }

  tags = var.tags
}
