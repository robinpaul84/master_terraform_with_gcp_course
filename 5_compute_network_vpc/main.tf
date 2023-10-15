resource "google_compute_network" "vpc_network" {
  name                    = "vpc-network"
  //auto_create_subnetworks = true
}

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = "test-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = true
  
 
}

output "customvpc" {
  value = google_compute_network.vpc_network.id
}