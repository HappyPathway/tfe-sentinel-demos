variable "organization" {}
resource "tfe_sentinel_policy" "test" {
  name = "check-version"
  organization = "${var.organization}"
  policy = "${file("${path.module}/policies/check_version.sentinel")}"
  enforce_mode = "hard-mandatory"
}