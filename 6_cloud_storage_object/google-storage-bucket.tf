resource "google_storage_bucket" "myfirstbucket" {
  name          = "mybucketforterraformcourse-27-sep-object-1234"
  location      = "US"
  uniform_bucket_level_access = true

}

resource "google_storage_bucket_object" "picture" {
  name   = "butterfly01"
  source = "butterfly.webp"
  bucket = google_storage_bucket.myfirstbucket.name
  depends_on = [ google_storage_bucket.myfirstbucket ]
}