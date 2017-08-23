variable "global_bucket" {}
variable "global_key" {}
variable "global_region" {}

variable "env_bucket" {}
variable "env_key" {}
variable "env_region" {}

variable "app_bucket" {}
variable "app_key" {}
variable "app_region" {}

variable "service_bucket" {}
variable "service_key" {}
variable "service_region" {}

data "terraform_remote_state" "global" {
  backend = "s3"

  config {
    bucket         = "${var.global_bucket}"
    key            = "${var.global_key}"
    region         = "${var.global_region}"
    dynamodb_table = "terraform_state_lock"
  }
}

data "terraform_remote_state" "env" {
  backend = "s3"

  config {
    bucket         = "${var.env_bucket}"
    key            = "${var.env_key}"
    region         = "${var.env_region}"
    dynamodb_table = "terraform_state_lock"
  }
}

data "terraform_remote_state" "app" {
  backend = "s3"

  config {
    bucket         = "${var.app_bucket}"
    key            = "${var.app_key}"
    region         = "${var.app_region}"
    dynamodb_table = "terraform_state_lock"
  }
}

data "terraform_remote_state" "service" {
  backend = "s3"

  config {
    bucket         = "${var.service_bucket}"
    key            = "${var.service_key}"
    region         = "${var.service_region}"
    dynamodb_table = "terraform_state_lock"
  }
}
