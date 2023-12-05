output "public_ip" {
  value = azurerm_public_ip.public_ip.ip_address

  description = "Value for the public IP address used to access the app"
}

output "acr_name" {
  value = azurerm_container_registry.container_registry.name

  description = "Name of the Container Registry"
}

output "acr_url" {
  value = azurerm_container_registry.container_registry.login_server

  description = "URL of the Container Registry"
}

resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.kubernetes_cluster]
  filename   = "../kubernetes/kubeconfig"
  content    = azurerm_kubernetes_cluster.kubernetes_cluster.kube_config_raw
}
