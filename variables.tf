variable "location" {
  default = "westus"
  description = "The Azure Region in which all resources in this example should be provisioned"
}

variable "prefix_env" {
  default = "D"
  description = "prefix env"
}

variable "prefix_loc" {
  default = "WE"
  description = "prefix env"
}

variable "prefix_proj" {
  default = "PJ-AI"
  description = "prefix env"
}

variable "agents_size" {
  default = "Standard_D2s_v3"
  description = "The default virtual machine size for the Kubernetes agents"
}

variable "agents_count" {
  default = "1"
  description = "AKS node count "
}

variable "client_id" {
  description = "AAD client_id"
}

variable "client_secret" {
  description = "AAD client_secret"
}