resource "google_app_engine_standard_app_version" "latest_version" {


  #You can define App Engine versions in Terraform,You can remove the app.yaml file
  version_id = var.deployment_version
  service    = "default"
  runtime    = "nodejs20"
 entrypoint {
    shell = "node index.js"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/${google_storage_bucket.app.name}/${google_storage_bucket_object.app.name}"
    }
  }

   instance_class = "F1"

  automatic_scaling {
    max_concurrent_requests = 10
    min_idle_instances      = 1
    max_idle_instances      = 3
    min_pending_latency     = "1s"
    max_pending_latency     = "5s"
    standard_scheduler_settings {
      target_cpu_utilization        = 0.5
      target_throughput_utilization = 0.75
      min_instances                 = 0
      max_instances                 = 4
    }
  }
  noop_on_destroy = true
  delete_service_on_destroy = true
}