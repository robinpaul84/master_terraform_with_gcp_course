resource "google_sql_database_instance" "main" {
  name             = "mysql-from-tf"
  database_version = "MYSQL_8_0_31"
  region = "${var.region}"
  settings {
    tier    = "db-f1-micro"
  }
  deletion_protection =  "false" #set false when creating instance ; set true when destroying
}

resource "google_sql_database" "database" {
  name     = "my-database-from-tf"
  instance = google_sql_database_instance.main.name

}

resource "google_sql_user" "users" {
  name     = "me"
  instance = google_sql_database_instance.main.name
  host     = "me.com"
  password = "changemypassword"
}