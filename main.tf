terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
  # Para ambiente Windows, o caminho para comunicação com o Docker pode ser "npipe"
  # host = "npipe:////.//pipe//docker_engine"

  # Se você estiver em um ambiente Unix, use o seguinte:
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "nginx_container"

  ports {
    internal = 80
    external = 8000
  }
}
