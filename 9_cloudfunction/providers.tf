provider "google" {
    project = "${var.project-name}"
    region = "us-central1"
    credentials = "../creds/keys.json"
  
}