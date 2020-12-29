output "namespace_name" {
  description = "The name of the eventhub namespace"
  value       = azurerm_eventhub_namespace.eventhub.name
}

output "primary_connection_string" {
  description = "The primary connection string"
  value       = azurerm_eventhub_namespace.eventhub.default_primary_connection_string
  sensitive   = true
}