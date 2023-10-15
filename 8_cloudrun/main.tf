resource "google_cloud_run_service" "default" {
  name     = "cloudrun-terraform"
  location = "us-central1"

  template {
    spec {
      containers {
        #get docker image from https://console.cloud.google.com/gcr/images/google-samples?tab=vulnz
        image = "gcr.io/google-samples/hello-app:1.0"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}


#to allow permission to call url
data "google_iam_policy" "admin" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "policy" {
  location = google_cloud_run_service.default.location
  project = google_cloud_run_service.default.project
  service = google_cloud_run_service.default.name
  policy_data = data.google_iam_policy.admin.policy_data
}