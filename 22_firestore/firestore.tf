resource "google_firestore_database" "database" {

  name = "tflab-class2"
  location_id = "nam5"
  type        = "FIRESTORE_NATIVE"
  delete_protection_state = "DELETE_PROTECTION_DISABLED"

}

resource "random_id" "variable"{
  byte_length = 8
}

resource "google_firestore_field" "single-index" {
  database = "tflab-class2"
  collection = "chatrooms_${random_id.variable.hex}"
  field = "name"

  index_config {
    indexes {
        order = "ASCENDING"
        query_scope = "COLLECTION_GROUP"
    }
    indexes {
        array_config = "CONTAINS"
    }
  }

  ttl_config {}
  depends_on = [ google_firestore_database.database ]
}
