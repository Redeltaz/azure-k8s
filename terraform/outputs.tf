output "public_ip" {
  value = azurerm_public_ip.public_ip.ip_address

  description = "Value for the public IP address used to access the app"
}

resource "local_file" "kubeconfig" {
  depends_on   = [azurerm_kubernetes_cluster.kubernetes_cluster]
  filename     = "../kubeconfig"
  content      = azurerm_kubernetes_cluster.kubernetes_cluster.kube_config_raw
}
