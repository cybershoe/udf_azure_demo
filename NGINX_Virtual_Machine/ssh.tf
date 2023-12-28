resource "random_pet" "ssh_key_name" {
  prefix = "ssh"
  separator = ""
}

resource "tls_private_key" "ssh_private_key_gen" {
  algorithm = "RSA"
  rsa_bits = 4096
  
}

resource "azurerm_ssh_public_key" "ssh_public_key_gen" {
  name = random_pet.ssh_key_name.id
  resource_group_name = azurerm_resource_group.nginx.name
  location = azurerm_resource_group.nginx.location
  public_key = tls_private_key.ssh_private_key_gen.public_key_openssh
}

resource "local_file" "ssh_private_key" {
  content = tls_private_key.ssh_private_key_gen.private_key_pem
  filename = format("%s/ssh_private_key.pem", path.module)
  file_permission = "0600"
}