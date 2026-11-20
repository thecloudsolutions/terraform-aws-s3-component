variable "access_grants" {
  type = map(object({
    region                             = optional(string)
    account_id                         = optional(string)
    access_grants_location_id          = optional(string)
    access_grants_location_custom_name = optional(string)
    permission                         = string
    s3_prefix_type                     = optional(string)

    access_grants_location_configuration = optional(object({
      s3_sub_prefix = optional(string)
    }))

    grantee = object({
      grantee_identifier = string
      grantee_type       = string
    })

    tags = optional(map(string))
  }))

  default = {}
}

variable "access_grants_instances" {
  type = map(object({
    region              = optional(string)
    account_id          = optional(string)
    identity_center_arn = optional(string)

    tags = optional(map(string))
  }))

  default = {}
}

variable "access_grants_instance_resource_policies" {
  type = map(object({
    region                             = optional(string)
    account_id                         = optional(string)
    access_grants_instance_custom_name = optional(string)
    policy                             = string
  }))

  default = {}
}

variable "access_grants_locations" {
  type = map(object({
    region                             = optional(string)
    account_id                         = optional(string)
    access_grants_instance_custom_name = optional(string)
    iam_role_arn                       = string
    location_scope                     = optional(string)

    tags = optional(map(string))
  }))

  default = {}
}

variable "access_points" {
  type = map(object({
    region            = optional(string)
    bucket            = optional(string)
    name              = string
    account_id        = optional(string)
    bucket_account_id = optional(string)
    policy            = optional(string)

    public_access_block_configuration = optional(object({
      block_public_acls       = optional(bool)
      block_public_policy     = optional(bool)
      ignore_public_acls      = optional(bool)
      restrict_public_buckets = optional(bool)
    }))

    vpc_configuration = optional(object({
      vpc_id = string
    }))

    tags = optional(map(string))
  }))

  default = {}
}

variable "access_point_policies" {
  type = map(object({
    region                   = optional(string)
    access_point_arn         = optional(string)
    access_point_custom_name = optional(string)
    policy                   = string
  }))

  default = {}
}

variable "bucket" {
  type = object({
    region           = optional(string)
    bucket           = optional(string)
    bucket_namespace = optional(string)
    # (Optional, Forces new resource) Namespace determining the bucket naming scope.
    bucket_prefix       = optional(string)
    force_destroy       = optional(bool)
    object_lock_enabled = optional(bool)

    tags = optional(map(string))
  })

  default = null
}

variable "bucket_abac" {
  type = object({
    region                = optional(string)
    bucket                = optional(string)
    expected_bucket_owner = optional(string)

    abac_status = object({
      status = string
    })
  })

  default = null
}

variable "bucket_accelerate_configuration" {
  type = object({
    region                = optional(string)
    bucket                = optional(string)
    expected_bucket_owner = optional(string)
    status                = string
  })

  default = null
}

variable "bucket_acl" {
  type = object({
    region                = optional(string)
    acl                   = optional(string)
    bucket                = optional(string)
    expected_bucket_owner = optional(string)

    access_control_policy = optional(object({
      grant = list(object({
        permission = string

        grantee = object({
          email_address = optional(string)
          id            = optional(string)
          type          = string
          uri           = optional(string)
        })
      }))

      owner = object({
        id           = string
        display_name = optional(string)
      })
    }))
  })

  default = null
}

variable "bucket_analytics_configuration" {
  type = object({
    region = optional(string)
    name   = string

    bucket = optional(string)
    filter = optional(object({
      prefix = optional(string)
      tags   = optional(map(string))
    }))

    storage_class_analysis = optional(object({
      data_export = object({
        output_schema_version = optional(string)
        destination = object({
          s3_bucket_destination = object({
            bucket_arn        = string
            bucket_account_id = optional(string)
            format            = optional(string)
            prefix            = optional(string)
          })
        })
      })
    }))
  })

  default = null
}

variable "bucket_analytics_configurations" {
  type = map(object({
    region = optional(string)
    name   = string

    bucket = optional(string)
    filter = optional(object({
      prefix = optional(string)
      tags   = optional(map(string))
    }))

    storage_class_analysis = optional(object({
      data_export = object({
        output_schema_version = optional(string)
        destination = object({
          s3_bucket_destination = object({
            bucket_arn        = string
            bucket_account_id = optional(string)
            format            = optional(string)
            prefix            = optional(string)
          })
        })
      })
    }))
  }))

  default = {}
}

variable "bucket_cors_configuration" {
  type = object({
    region                = optional(string)
    bucket                = optional(string)
    expected_bucket_owner = optional(string)

    cors_rule = set(object({
      allowed_headers = optional(set(string))
      allowed_methods = set(string)
      allowed_origins = set(string)
      expose_headers  = optional(set(string))
      id              = optional(string)
      max_age_seconds = optional(number)
    }))
  })

  default = null
}

variable "bucket_intelligent_tiering_configurations" {
  type = map(object({
    region = optional(string)
    bucket = optional(string)
    name   = string
    status = optional(string)

    filter = optional(object({
      prefix = optional(string)
      tags   = optional(map(string))
    }))

    tiering = set(object({
      access_tier = string
      days        = number
    }))
  }))

  default = {}
}

variable "bucket_inventory" {
  type = object({
    region                   = optional(string)
    name                     = string
    included_object_versions = string

    schedule = object({
      frequency = string
    })

    destination = object({
      bucket = object({
        bucket_arn = string
        format     = string
        account_id = optional(string)
        prefix     = optional(string)
        encryption = optional(object({
          sse_kms = optional(object({
            key_id = string
          }))

          sse_s3 = optional(object({}))
        }))
      })
    })

    bucket  = optional(string)
    enabled = optional(bool)

    filter = optional(object({
      prefix = optional(string)
    }))

    optional_fields = optional(list(string))
  })

  default = null
}

variable "bucket_inventories" {
  type = map(object({
    region                   = optional(string)
    name                     = string
    included_object_versions = string

    schedule = object({
      frequency = string
    })

    destination = object({
      bucket = object({
        bucket_arn = string
        format     = string
        account_id = optional(string)
        prefix     = optional(string)
        encryption = optional(object({
          sse_kms = optional(object({
            key_id = string
          }))

          sse_s3 = optional(object({}))
        }))
      })
    })

    bucket  = optional(string)
    enabled = optional(bool)

    filter = optional(object({
      prefix = optional(string)
    }))

    optional_fields = optional(list(string))
  }))

  default = {}
}

variable "bucket_lifecycle_configuration" {
  type = object({
    region                                 = optional(string)
    bucket                                 = optional(string)
    expected_bucket_owner                  = optional(string)
    transition_default_minimum_object_size = optional(string)

    rule = list(object({
      abort_incomplete_multipart_upload = optional(object({
        days_after_initiation = optional(number)
      }))

      expiration = optional(object({
        date                         = optional(string)
        days                         = optional(number)
        expired_object_delete_marker = optional(bool)
      }))

      filter = optional(object({
        and = optional(object({
          object_size_greater_than = optional(number)
          object_size_less_than    = optional(number)
          prefix                   = optional(string)
          tags                     = optional(map(string))
          # (Optional) Key-value map of object tags to which the lifecycle rule applies.
        }))

        object_size_greater_than = optional(number)
        object_size_less_than    = optional(number)
        prefix                   = optional(string)

        tag = optional(list(object({
          key   = string
          value = string
        })), [])
      }))

      id     = string
      prefix = optional(string)

      noncurrent_version_expiration = optional(object({
        newer_noncurrent_versions = optional(number)
        noncurrent_days           = number
      }))

      noncurrent_version_transition = optional(list(object({
        newer_noncurrent_versions = optional(number)
        noncurrent_days           = number
        storage_class             = string
      })), [])

      status = string

      transition = optional(list(object({
        date          = optional(string)
        days          = optional(number)
        storage_class = string
      })), [])
    }))

    timeouts = optional(object({
      create = optional(string)
      update = optional(string)
    }))
  })

  default = null
}

variable "bucket_logging" {
  type = object({
    region                = optional(string)
    bucket                = optional(string)
    expected_bucket_owner = optional(string)
    target_bucket         = string

    target_grant = optional(set(object({
      grantee = object({
        email_address = optional(string)
        # (Optional) Email address of the logging permission grantee.
        id   = optional(string)
        type = string
        uri  = optional(string)
      })

      permission = string
    })))

    target_object_key_format = optional(object({
      partitioned_prefix = optional(object({
        partition_date_source = string
        # (Required) Source used to determine the date partition.
      }))

      simple_prefix = optional(object({}))
      # (Optional) Enables the simple S3 log object key format.
    }))

    target_prefix = string
  })

  default = null
}

variable "bucket_metadata_configuration" {
  type = object({
    region                = optional(string)
    bucket                = optional(string)
    expected_bucket_owner = optional(string)

    metadata_configuration = object({
      inventory_table_configuration = object({
        configuration_state = string
        encryption_configuration = optional(object({
          kms_key_arn   = optional(string)
          sse_algorithm = string
        }))
      })

      journal_table_configuration = object({
        encryption_configuration = optional(object({
          kms_key_arn   = optional(string)
          sse_algorithm = string
        }))

        record_expiration = object({
          days       = optional(number)
          expiration = string
        })
      })
    })

    timeouts = optional(object({
      create = optional(string)
    }))
  })

  default = null
}

variable "bucket_metrics" {
  type = map(object({
    region = optional(string)
    bucket = optional(string)
    name   = string

    filter = optional(object({
      access_point = optional(string)
      prefix       = optional(string)
      tags         = optional(map(string))
    }))
  }))

  default = {}
}

variable "bucket_notification" {
  type = object({
    region      = optional(string)
    bucket      = optional(string)
    eventbridge = optional(bool)

    lambda_function = optional(list(object({
      events              = set(string)
      filter_prefix       = optional(string)
      filter_suffix       = optional(string)
      id                  = optional(string)
      lambda_function_arn = optional(string)
    })))

    queue = optional(list(object({
      events        = set(string)
      filter_prefix = optional(string)
      filter_suffix = optional(string)
      id            = optional(string)
      queue_arn     = string
    })))

    topic = optional(list(object({
      events        = set(string)
      filter_prefix = optional(string)
      filter_suffix = optional(string)
      id            = optional(string)
      topic_arn     = string
    })))
  })

  default = null
}

variable "bucket_object_lock_configuration" {
  type = object({
    region                = optional(string)
    bucket                = optional(string)
    expected_bucket_owner = optional(string)
    object_lock_enabled   = optional(string)

    rule = optional(object({
      default_retention = object({
        days  = optional(number)
        mode  = string
        years = optional(number)
      })
    }))

    token = optional(string)
  })

  default = null
}

variable "bucket_ownership_controls" {
  type = object({
    region = optional(string)
    rule = object({
      object_ownership = string
    })

    bucket = optional(string)
  })

  default = null
}

variable "bucket_policy" {
  type = object({
    region = optional(string)
    policy = string
    bucket = optional(string)
  })

  default = null
}

variable "bucket_public_access_block" {
  type = object({
    region                  = optional(string)
    bucket                  = optional(string)
    block_public_acls       = optional(bool)
    block_public_policy     = optional(bool)
    ignore_public_acls      = optional(bool)
    restrict_public_buckets = optional(bool)
    skip_destroy            = optional(bool)
    # (Optional) Whether to retain the public access block when destroying its Terraform resource.
  })

  default = null
}

variable "bucket_replication_configuration" {
  type = object({
    region = optional(string)
    role   = string
    bucket = optional(string)
    token  = optional(string)

    rule = list(object({
      delete_marker_replication = optional(object({
        status = string
      }))
      destination = object({
        access_control_translation = optional(object({
          owner = string
        }))

        account = optional(string)
        bucket  = string

        encryption_configuration = optional(object({
          replica_kms_key_id = string
        }))

        metrics = optional(object({
          event_threshold = optional(object({
            minutes = number
          }))

          status = string
        }))

        replication_time = optional(object({
          status = string

          time = object({
            minutes = number
          })
        }))

        storage_class = optional(string)
      })

      existing_object_replication = optional(object({
        status = string
      }))

      filter = optional(object({
        and = optional(object({
          prefix = optional(string)
          tags   = optional(map(string))
        }))

        prefix = optional(string)

        tag = optional(object({
          key   = string
          value = string
        }))
      }))

      id       = optional(string)
      prefix   = optional(string)
      priority = optional(string)

      source_selection_criteria = optional(object({
        replica_modifications = optional(object({
          status = string
        }))
        sse_kms_encrypted_objects = optional(object({
          status = string
        }))
      }))

      status = string
    }))
  })

  default = null
}

variable "bucket_request_payment_configuration" {
  type = object({
    region                = optional(string)
    bucket                = optional(string)
    expected_bucket_owner = optional(string)
    payer                 = string
  })

  default = null
}

variable "bucket_server_side_encryption_configuration" {
  type = object({
    region                = optional(string)
    bucket                = optional(string)
    expected_bucket_owner = optional(string)

    rule = object({
      apply_server_side_encryption_by_default = optional(object({
        sse_algorithm     = string
        kms_master_key_id = optional(string)
      }))

      blocked_encryption_types = optional(list(string))
      # (Optional) Server-side encryption types to block for object uploads.
      bucket_key_enabled = optional(bool)
    })
  })

  default = null
}

variable "bucket_versioning" {
  type = object({
    region = optional(string)
    versioning_configuration = object({
      status     = string
      mfa_delete = optional(string)
    })

    bucket                = optional(string)
    expected_bucket_owner = optional(string)
    mfa                   = optional(string)
  })

  default = null
}

variable "bucket_website_configuration" {
  type = object({
    region = optional(string)
    bucket = optional(string)
    error_document = optional(object({
      key = string
    }))

    expected_bucket_owner = optional(string)

    index_document = optional(object({
      suffix = string
    }))

    redirect_all_requests_to = optional(object({
      host_name = string
      protocol  = optional(string)
    }))

    routing_rule = optional(object({
      condition = optional(object({
        http_error_code_returned_equals = optional(number)
        key_prefix_equals               = optional(string)
      }))

      redirect = object({
        host_name               = optional(string)
        http_redirect_code      = optional(number)
        protocol                = optional(string)
        replace_key_prefix_with = optional(string)
        replace_key_with        = optional(string)
      })
    }))

    routing_rules = optional(string)
  })

  default = null
}

variable "directory_bucket" {
  type = object({
    region          = optional(string)
    bucket          = string
    data_redundancy = optional(string)
    force_destroy   = optional(bool)

    location = object({
      name = string
      type = optional(string)
    })

    type = optional(string)
    tags = optional(map(string))
  })

  default = null
}

variable "directory_bucket_access_point_scopes" {
  type = map(object({
    region                   = optional(string)
    account_id               = optional(string)
    name                     = optional(string)
    access_point_custom_name = optional(string)

    scope = object({
      permissions = optional(list(string))
      prefixes    = optional(list(string))
    })
  }))

  default = {}
}

variable "multi_region_access_points" {
  type = map(object({
    region     = optional(string)
    account_id = optional(string)

    details = object({
      name = string
      public_access_block = optional(object({
        block_public_acls       = optional(bool)
        block_public_policy     = optional(bool)
        ignore_public_acls      = optional(bool)
        restrict_public_buckets = optional(bool)
      }))

      region = set(object({
        bucket            = optional(string)
        bucket_account_id = optional(string)
      }))
    })

    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
    }))
  }))

  default = {}
}

variable "multi_region_access_point_policies" {
  type = map(object({
    region     = optional(string)
    account_id = optional(string)

    details = object({
      name                                  = optional(string)
      multi_region_access_point_custom_name = optional(string)
      policy                                = string
    })

    timeouts = optional(object({
      create = optional(string)
      update = optional(string)
    }))
  }))

  default = {}
}

variable "multi_region_access_point_routes" {
  type = map(object({
    region                                = optional(string)
    account_id                            = optional(string)
    mrap                                  = optional(string)
    multi_region_access_point_custom_name = optional(string)

    route = set(object({
      bucket                  = string
      region                  = string
      traffic_dial_percentage = number
    }))
  }))

  default = {}
}

variable "objects" {
  type = map(object({
    region                        = optional(string)
    key                           = string
    bucket                        = optional(string)
    acl                           = optional(string)
    bucket_key_enabled            = optional(bool)
    cache_control                 = optional(string)
    checksum_algorithm            = optional(string)
    content_base64                = optional(string)
    content_disposition           = optional(string)
    content_encoding              = optional(string)
    content_language              = optional(string)
    content_type                  = optional(string)
    content                       = optional(string)
    etag                          = optional(string)
    force_destroy                 = optional(bool)
    kms_key_id                    = optional(string)
    metadata                      = optional(map(string))
    object_lock_legal_hold_status = optional(string)
    object_lock_mode              = optional(string)
    object_lock_retain_until_date = optional(string)

    override_provider = optional(object({
      default_tags = optional(object({
        tags = optional(map(string))
        # (Optional) Empty map used to suppress provider-level default tags for this object.
      }))
    }))

    server_side_encryption = optional(string)
    source_hash            = optional(string)
    source_to_file         = optional(string)
    storage_class          = optional(string)
    website_redirect       = optional(string)
    tags                   = optional(map(string))
  }))

  default = {}
}

variable "storage_lens_configurations" {
  type = map(object({
    region     = optional(string)
    config_id  = string
    account_id = optional(string)

    storage_lens_configuration = object({
      account_level = object({
        activity_metrics = optional(object({
          enabled = optional(bool)
        }))

        advanced_cost_optimization_metrics = optional(object({
          enabled = optional(bool)
        }))

        advanced_data_protection_metrics = optional(object({
          enabled = optional(bool)
        }))

        advanced_performance_metrics = optional(object({
          enabled = optional(bool)
        }))

        bucket_level = object({
          activity_metrics = optional(object({
            enabled = optional(bool)
          }))

          advanced_cost_optimization_metrics = optional(object({
            enabled = optional(bool)
          }))

          advanced_data_protection_metrics = optional(object({
            enabled = optional(bool)
          }))

          advanced_performance_metrics = optional(object({
            enabled = optional(bool)
          }))

          detailed_status_code_metrics = optional(object({
            enabled = optional(bool)
          }))

          prefix_level = optional(object({
            storage_metrics = object({
              enabled = optional(bool)
              selection_criteria = optional(object({
                delimiter                    = optional(string)
                max_depth                    = optional(number)
                min_storage_bytes_percentage = optional(number)
              }))
            })
          }))
        })

        detailed_status_code_metrics = optional(object({
          enabled = optional(bool)
        }))
      })

      aws_org = optional(object({
        arn = string
      }))

      data_export = optional(object({
        cloud_watch_metrics = optional(object({
          enabled = bool
        }))

        s3_bucket_destination = optional(object({
          account_id = string
          arn        = optional(string)
          encryption = optional(object({
            sse_kms = optional(object({
              key_id = string
            }))

            sse_s3 = optional(object({}))
          }))

          format                = string
          output_schema_version = string
          prefix                = optional(string)
        }))

        storage_lens_table_destination = optional(object({
          enabled = bool
          encryption = optional(object({
            sse_kms = optional(object({
              key_id = string
            }))

            sse_s3 = optional(object({}))
          }))
        }))
      }))

      expanded_prefixes_data_export = optional(object({
        s3_bucket_destination = optional(object({
          account_id = string
          arn        = optional(string)
          encryption = optional(object({
            sse_kms = optional(object({
              key_id = string
            }))

            sse_s3 = optional(object({}))
          }))

          format                = string
          output_schema_version = string
          prefix                = optional(string)
        }))

        storage_lens_table_destination = optional(object({
          enabled = bool
          encryption = optional(object({
            sse_kms = optional(object({
              key_id = string
            }))

            sse_s3 = optional(object({}))
          }))
        }))
      }))

      enabled = bool
      exclude = optional(object({
        buckets = optional(set(string))
        regions = optional(set(string))
      }))

      include = optional(object({
        buckets = optional(set(string))
        regions = optional(set(string))
      }))

      prefix_delimiter = optional(string)
    })

    tags = optional(map(string))
  }))

  default = {}
}
