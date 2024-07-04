
resource "google_compute_network" "mynetwork" {
  name = "mmynewnet"
  auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "mysubent" {
  name = "newsubent"
  ip_cidr_range = "10.0.3.0/24"
  region = "us-central1"
  network = google_compute_network.mynetwork.name
}


resource "google_compute_firewall" "allowhttp" {
    name = "allowhttp"
    network = google_compute_network.mynetwork.name
    allow {
      protocol = "tcp"
      ports = [ "80" ]
    }
    source_ranges = [ "0.0.0.0/0" ]
}
