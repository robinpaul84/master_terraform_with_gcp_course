resource "google_pubsub_topic" "tf_topic" {
  name = "terraform_lab_pubsubtopic"
  labels = {
    foo = "bar"
  }
  message_retention_duration = "86600s"
}
resource "google_pubsub_subscription" "tf_subs" {
  name  = "terraform_lab_subscription"
  topic = google_pubsub_topic.tf_topic.name
  message_retention_duration = "1200s"
  retain_acked_messages      = true
  ack_deadline_seconds = 20
  depends_on = [ google_pubsub_topic.tf_topic ]
}