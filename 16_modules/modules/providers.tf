provider "google" {
    project = "${var.project-id}"
    region = "${var.region}"
    zone = "${var.zone}"
    credentials = "C:/course/live/master_terraform_with_gcp/master_terraform_with_gcp/creds/keys.json"
}