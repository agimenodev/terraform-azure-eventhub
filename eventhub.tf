resource "azurerm_eventhub_namespace" "eventhub" {
  name                     = var.eventhub_name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  sku                      = "Standard"
  capacity                 = var.capacity
  auto_inflate_enabled     = var.auto_inflate_enabled
  maximum_throughput_units = var.auto_inflate_enabled ? var.maximum_throughput_units : null
  tags                     = var.tags

  network_rulesets {
    default_action = "Deny"
    
    virtual_network_rule {
      subnet_id = var.vnet_rule_subnet_id
    }
  }
}

resource "azurerm_eventhub" "eventhub" {
  for_each = var.eventhubs

  name                = each.key
  namespace_name      = azurerm_eventhub_namespace.eventhub.name
  resource_group_name = var.resource_group_name
  partition_count     = each.value.partition_count
  message_retention   = each.value.message_retention
}

resource "azurerm_monitor_diagnostic_setting" "eventhub" {
  name                           = var.eventhub_name
  target_resource_id             = azurerm_eventhub_namespace.eventhub.id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  log_analytics_destination_type = "Dedicated"

  log {
    category = "ArchiveLogs"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "AutoScaleLogs"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "CustomerManagedKeyUserLogs"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "EventHubVNetConnectionEvent"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "KafkaCoordinatorLogs"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "KafkaUserErrorLogs"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "OperationalLogs"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  lifecycle {
    ignore_changes = [
      log_analytics_destination_type,
    ]
  }
}
