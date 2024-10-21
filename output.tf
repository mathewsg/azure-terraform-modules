output "resource_group_name" {
  value       = azurerm_resource_group.this.name
  description = "The Resource Group Name"
}

output "resource_group_id" {
  value       = azurerm_resource_group.this.id
  description = "The Resource Group Resource Id"
}

