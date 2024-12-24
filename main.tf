terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
  required_version = ">=0.13"
}
provider "docker" {
  host = "ssh://bist@89.169.165.160"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}
resource "random_password" "root_password" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}
resource "random_password" "user_password" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "docker_image" "mysql-vm" {
  name         = "mysql:8"
  
 }

resource "docker_container" "mysql-vm" {
  image = docker_image.mysql-vm.image_id
  name  = "mysql-vm"
  env = [
    "MYSQL_ROOT_PASSWORD=example_${random_password.root_password.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=example_${random_password.user_password.result}"
  ]

  ports {
    internal = 3306
    external = 3306
  }
 }

