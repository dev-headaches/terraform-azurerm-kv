output "kvid" {
  value       = azurerm_key_vault.keyvault.id
  description = "the ID of the Keyvault"
}

output "kvhex" {
  value       = random_id.keyvault.hex
  description = "the random hex used in the kv name"
}