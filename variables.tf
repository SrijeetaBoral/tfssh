variable "region" {
  description = "AWS region for all resources"
  type        = string
}

variable "project_id" {
  description = "Task id used in resource names and tags"
  type        = string
}

variable "project_tag" {
  description = "Value of the Project tag"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ssh_key" {
  description = "Provides custom public SSH key"
  type        = string
}