resource "google_compute_instance" "app" {
  count        = 3
  name         = "gitlab-runner-${count.index}"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["gitlab-runner"]
  project      = "${var.project}"

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }
  network_interface {
    network = "default"

    access_config {
    }
}
  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }
}
