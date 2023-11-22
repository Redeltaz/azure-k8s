variable "subscription_id" {
    type = string

    sensitive = true
}

variable "project_name" {
    type = string

    default = "ESGI-antoine-lucas"
}

variable "region" {
    type = string

    default = "France Central"
}

variable "default_tags" {
    type = map(string)

    default = {
      managed = "terraform"
      project = "ESGI-devops"
    }
}
