#have to enable Google Cloud Memorystore for Redis API from google cloud console 

resource "google_redis_instance" "my_memorystore_redis_instance" {
  name           = "myinstance"
  tier           = "BASIC"
  memory_size_gb = 2
  region         = "us-central1"
  redis_version  = "REDIS_6_X"
}

output "host" {
  description = "The IP address of the instance."
  value       = google_redis_instance.my_memorystore_redis_instance.host
}