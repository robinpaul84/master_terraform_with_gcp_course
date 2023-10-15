resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.this.id
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["allow-ssh"]
}



resource "google_compute_firewall" "allow_http" {
  name    = "allow-http-rule"
  network = google_compute_network.this.id
  allow {
    ports    = ["80"]
    protocol = "tcp"
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["allow-http"]
  

}


resource "google_compute_firewall" "allow_http_internal" {
  name    = "allow-http-rule-internal"
  network = google_compute_network.this.id
  allow {
    ports    = ["80"]
    protocol = "tcp"
  }
  //source_ranges from "10.10.10.0/24"
  source_ranges = [var.ip_cidr_range[0]]
  target_tags = ["allow-http-internal"]
  

}