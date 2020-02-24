variable "profile" {}

variable "username" {
  type = string
  default = "postgres"
}

variable "password" {
  type = string
}

variable "db_identifier" {
  type = string
}

variable "vpc" {
  type = string
}
