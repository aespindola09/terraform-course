resource "google_compute_network" "vpc_network" {
  description = "red de prueba"
  name = "terraform-network"
}

resource "google_compute_firewall" "terraform-http" {
  name    = "terraform-http-input"
  network = "${google_compute_network.vpc_network.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80",]

  }
target_tags = ["http-server"]  
}

resource "google_compute_firewall" "terraform-ssh" {
  name    = "terraform-ssh-input"
  network = "${google_compute_network.vpc_network.name}"

  allow {
    protocol = "tcp"
    ports    = ["22"]

  }
target_tags = ["ssh"]  
}