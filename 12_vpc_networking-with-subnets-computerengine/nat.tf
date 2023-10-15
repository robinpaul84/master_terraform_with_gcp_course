/*
When a Private subnet is associated with a Nat gateway, then only it would consider private. Because private servers need to communicate with the internet for patch installation or any other software upgrades. But they are private so they can’t able to communicate on the Internet. So the Nat gateway will help the private servers to communicate with the internet with the help of a Public IP. When you create a Cloud Nat in Google Cloud, it will create a Public IP along with it.

Now we need to create a Cloud Nat and associate the NAt with the Private subnet.
*/

# NAT ROUTER
resource "google_compute_router" "this" {
  name    = "${var.name}-${local.type[1]}-router"
  region  = google_compute_subnetwork.this[1].region
  network = google_compute_network.this.id
}

resource "google_compute_router_nat" "this" {
  name                               = "${var.name}-${local.type[1]}-router-nat"
  router                             = google_compute_router.this.name
  region                             = google_compute_router.this.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                             = "${var.name}-${local.type[1]}-subnetwork"
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
