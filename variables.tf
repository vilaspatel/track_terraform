variable "resourcegroupname" {
  default = "test-rg"
  description = "A prefix used for all resources in this example"
}

variable "location" {
  default = "westus"
  description = "The Azure Region in which all resources in this example should be provisioned"
}

variable "prefix" {
  default = "prod"
  description = "prefix env"
}

variable "Elasticsearch_name" {
  default = "elasticsearch"
  description = "Elasticsearch clustername "
}