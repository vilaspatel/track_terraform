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

variable "agents_size" {
  default = "Standard_F2"
  description = "The default virtual machine size for the Kubernetes agents"
}

variable "agents_count" {
  default = "1"
  description = "AKS node count "
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to install"
  default     = "1.11.3"
}