
resource "digitalocean_droplet" "seedbox" {
    image = "ubuntu-20-04-x64"
    name = "seedbox"
    region = "ams3"
    size = "s-1vcpu-1gb"
    ssh_keys = [
        data.digitalocean_ssh_key.terraform.id
    ]

    connection {
        host = self.ipv4_address
        user = "root"
        type = "ssh"
        private_key = file(var.ssh_key_pah)
        timeout = "2m"
    }

    provisioner "remote-exec" {
        inline = [
        "apt update",
        "apt install -y nginx",
        "sleep 5",
        "apt install -y transmission-cli transmission-common transmission-daemon",
        "service transmission-daemon stop"
        ]
    }

    provisioner "file" {
        source      = "config/transmission/settings.json"
        destination = "/etc/transmission-daemon/settings.json"
    }

    provisioner "file" {
        source      = "config/nginx/default"
        destination = "/etc/nginx/sites-available/default"
    }

    provisioner "file" {
        source      = "config/transmission/index.html"
        destination = "/usr/share/transmission/web/index.html"
    }

    provisioner "remote-exec" {
        inline = [
        "service transmission-daemon start",
        "service nginx restart",
        ]
    }

}


