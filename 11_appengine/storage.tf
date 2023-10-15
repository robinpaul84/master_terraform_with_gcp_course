resource "google_storage_bucket" "app" {
  name          = "${var.project-name}-${random_id.app.hex}"
  location      = "US"
  force_destroy = true
  versioning {
    enabled = true
  }
}

resource "random_id" "app" {
  byte_length = 8
}

data "archive_file" "function_dist" {
  type        = "zip"
  source_dir  = "./app"
  output_path = "./app_${var.deployment_version}.zip"
}

resource "google_storage_bucket_object" "app" {
  name   = "app_${var.deployment_version}.zip"
  source = data.archive_file.function_dist.output_path
  bucket = google_storage_bucket.app.name
}