variable "AZURE_REGION" {
  description = "La Region"
  type        = string
}

variable "AZURE_RG_NAME" {
  description = "Resource Group Name"
  type        = string
}

variable "K8S_VERSION" {
  description = "Te version of Kubernetes "
  type        = number
}

variable "K8S_NAME" {
  description = "The name of EKS Cluster "
  type        = string
}

variable "K8S_VM_SIZE" {
  description = "The size of the VM"
  type        = string
}

variable "K8S_NODE_COUNT" {
  description = "The number of workers"
  type        = number
}

variable "VN_CIDR_BLOCK" {
  type        = string
  description = "CIDR BLOCK for the  VNET"
  sensitive   = false
}


variable "PUB_SUBNET" {
  type = string
}

variable "APP_SUBNET" {
  type = string
}

variable "DATA_SUBNET" {
  type = string
}

variable "ENVIRONMENT" {
  description = "Environment can ben Dev or prod and must be defined in $env.tfvars file"
  type        = string
}

