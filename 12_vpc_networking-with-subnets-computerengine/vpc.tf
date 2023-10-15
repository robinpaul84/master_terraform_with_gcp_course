#“google_compute_zones“ will help to get the list of all availability zones in the specific region. 
data "google_compute_zones" "this" {
  region  = var.region
  project = var.project-name
}

#A local value assigns a name to an expression  
locals {
  type   = ["public", "private"]
  zones = data.google_compute_zones.this.names
}

#output all available zones @ region us-central1
output "az" {
  value = data.google_compute_zones.this.names
}


# VPC
# In Google Cloud VPC Network is Global, which means it will span all regions. 
resource "google_compute_network" "this" {
  name                                        = "${var.name}-vpc"
  delete_default_routes_on_create = false
  auto_create_subnetworks           = false
  routing_mode                            = "REGIONAL"
}


