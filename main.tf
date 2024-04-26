variable "message" {
  type    = string
  default = "Hello, World!"
}

variable "port" {
  type    = number
  default = 8080
}

provider "docker" {
  
}

resource "docker_image" "nginx_image" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx_container" {
  name  = "nginx_container"
  image = docker_image.nginx_image.latest
  ports {
    internal = 80
    external = var.port
  }
}

output "nginx_url" {
  value = "http://localhost:${var.port}"
}
