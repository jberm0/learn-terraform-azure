# variables can be accessed by var.
# they can be defined in the apply command by passing, for example, -var "resource_group_name=myNewResourceGroupName"
variable "resource_group_name" {
  default = "rg-terraform-learn"
}