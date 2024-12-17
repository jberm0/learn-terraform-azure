# outputs print output certain fields that can be viewed by running terraform apply or terraform output
output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}