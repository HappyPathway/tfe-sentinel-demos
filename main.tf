variable "organization" {}
resource "tfe_sentinel_policy" "test" {
  count = "${var.check_version ? 1 : 0}"
  name = "check-version"
  organization = "${var.organization}"
  policy = "${file("${path.module}/policies/check_version.sentinel")}"
  enforce_mode = "hard-mandatory"
}

resource "tfe_sentinel_policy" "test" {
  count = "${var.allowed_versions ? 1 : 0}"
  name = "allowed-versions"
  organization = "${var.organization}"
  policy = "${file("${path.module}/policies/allowed_versions.sentinel")}"
  enforce_mode = "hard-mandatory"
}