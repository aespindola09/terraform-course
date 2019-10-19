resource "google_compute_instance" "vm_instance" {
    name    = "terraform-instance"
    machine_type = "f1-micro"
    tags    = ["web", "dev", "http-server", "ssh"]

  metadata_startup_script = "sudo apt-get update && sudo apt-get install nginx -y"

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-10"
        }
    }

        scheduling {
            automatic_restart   = false
            on_host_maintenance = "TERMINATE"
            preemptible         = true
        }

    network_interface {
        network = google_compute_network.vpc_network.self_link
        access_config {
            nat_ip = google_compute_address.vm_static_ip.address

        }
    }
}
