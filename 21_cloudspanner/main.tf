resource "google_spanner_instance" "main" {
  config       = "regional-${var.region}"
  display_name = "first-terraform-instance"
  num_nodes    = 3
  
}

resource "google_spanner_database" "database" {
  instance = google_spanner_instance.main.name
  name     = "my-tf-database"
  deletion_protection = false # else you cant delete the database
}