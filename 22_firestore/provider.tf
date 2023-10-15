provider "google" {
  project     = var.project-id
  region      = var.region
  credentials = "../creds/keys.json"
}


