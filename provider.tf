variable "api_key" {}
variable "ssh_key_pah" {}
variable "do_ssh_name" {}

terraform {
    required_providers {
        digitalocean = {
            source = "digitalocean/digitalocean"
            version = "~> 2.0"
        }
    }
}

provider "digitalocean" {
    token = var.api_key
}

data "digitalocean_ssh_key" "terraform" {
  name =  var.do_ssh_name
}