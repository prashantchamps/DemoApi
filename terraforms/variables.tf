variable "tf_storage_name" {
  type        = string
  description = "name of the storage account"
  default     = "mydemotfstate"
}
variable "tf_storage_rg_name" {
  type        = string
  description = "name of the storage account resource group"
  default     = "main-infra"
}
