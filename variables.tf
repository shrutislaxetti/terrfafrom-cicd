variable "access_key" {}
variable "secret_key" {}
variable "region" {}

variable "division" {}
variable "project" {}
variable "application" {}
variable "environment" {}
variable "node" {}
variable "created_by" {}

variable "engine_name" {}
variable "secretesmanger_name" {
 description = "secretes-manger-name "
 type = "string"
}
variable "secret_description" {}
variable "key" {
 description = "key name for tag"
 type = "string"
}
variable "value" {
 description = "value for tag"
 type = "string"
}
variable "dbname" {
 description = "database Name"
 type = "string"
}
variable "mysql_username" {
 description = "UserName for database"
 type = "string"
}
variable "engine" {
 description = "type of the database (ex: mysql,dynamodb)"
 type = "string"
}
variable "mysql_host" {
description = "database endpoint"
 type = "string"
}
variable "dbpassword" {
description = "database password"
 type = "string"
}
variable "port" {
  description = "The port on which to accept connections"
  default     = ""
}
variable "mysql_dbInstanceIdentifier" {
 description = "Select which RDS database this secret will access"
 type = "string"
}


