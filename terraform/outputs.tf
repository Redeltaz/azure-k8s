output "public_ip" {
    value = azurerm_public_ip.public_ip.ip_address

    description = "Value for the public IP address used to access the app"
}
