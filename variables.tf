variable eventhub_name {
  description = "The name of the eventhub"
  type        = string
}

variable location {
  description = "The location where the PostgreSQL DB should be created"
  type        = string
}

variable resource_group_name {
  description = "The name of the resource group the database should be deployed in"
  type        = string
}

variable capacity {
  description = "The capacity of the event hub namespace (1 - 20)"
  type        = number
  default     = 20
}

variable auto_inflate_enabled {
  description = "Enabled auto-inflate in order to ajutomatically scale up throughput when necessary"
  type        = bool
  default     = false
}

variable maximum_throughput_units {
  description = "Specifies the maximum number of throughput units when auto-inflate is enabled"
  type        = number
  default     = 5
}

variable eventhubs {
  description = "The eventhub configuration"
  type = map(object({
    partition_count   = number
    message_retention = number
  }))
}

variable tags {
  description = "Tags to add to resources"
  type        = map(string)
  default     = {}
}

variable vnet_rule_subnet_id {
  description = "The id of the subnet from which the eventhub can be accessed"
  type        = string
}

variable log_analytics_workspace_id {
  description = "The id of the log analytics workspace"
  type        = string
}