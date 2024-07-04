resource "google_storage_bucket" "mybucket" {
  name = "firstbuckkett"
  location = "EU"
}


resource "google_storage_bucket_object" "myfile" {
  name = "myfile"
  source = "index.html"
  bucket = google_storage_bucket.mybucket.name
}
   
resource "google_storage_object_access_control" "myac1" {
  bucket = google_storage_bucket.mybucket.name
  role = "READER"
  entity = "allUsers"
  object = google_storage_bucket_object.myfile.name
}