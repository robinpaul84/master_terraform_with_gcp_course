resource "random_id" "default" {
  byte_length = 8
}

resource "google_storage_bucket" "default" {
  name                        = "${random_id.default.hex}-gcf-source" # Every bucket name must be globally unique
  location                    = "US"
  uniform_bucket_level_access = true
}

data "archive_file" "default" {
  type        = "zip"
  output_path = "helloworldHttp.zip"
  source_dir  = "helloworldHttp"
}

resource "google_storage_bucket_object" "object" {
  name   = "helloworldHttp.zip"
  bucket = google_storage_bucket.default.name
  source = data.archive_file.default.output_path # Add path to the zipped function source code
}

resource "google_cloudfunctions_function" "default" {
  name        = "function-v1-tf"
  description = "a new function"


    runtime     = "nodejs16"
    entry_point = "helloHttp" # Set the entry point
    source_archive_bucket= google_storage_bucket.default.name
    source_archive_object = google_storage_bucket_object.object.name
    trigger_http          = true
    
  available_memory_mb   = 128
}

# Create IAM entry so all users can invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.default.project
  region         = google_cloudfunctions_function.default.region
  cloud_function = google_cloudfunctions_function.default.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}

output "function_uri" {
  value = google_cloudfunctions_function.default
}