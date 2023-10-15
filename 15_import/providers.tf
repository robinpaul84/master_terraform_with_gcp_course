provider "google" {
  project     = var.project-id
  zone        = var.zone
  region      = var.region
  credentials = "../creds/keys.json"
}
