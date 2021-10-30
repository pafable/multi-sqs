variable "default_tags" {
  type = map(string)
  default = {
    "Application" : "SQS Multi",
    "OwnerEmail" : "null",
    "OwnerName" : "null",
    "Project" : "null",
    "SupportEmail" : "null",
  }
  description = "Default tags"
}

# variable "workspace_iam_roles" {
#   type = map(string)
# }

variable "name" {
  type = string
}