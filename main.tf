provider "aws" {
	access_key 	= "${var.access_key}"
	secret_key 	= "${var.secret_key}"
	region     	= "${var.region}"
}
/************ Common Tags  **********************/	  
locals {
  tags = {
    Division    = "${var.division}"
    Project     = "${var.project}"
    Application = "${var.application}"
    Environment = "${var.environment}"
    Node        = "${var.node}"
    Created_by  = "${var.created_by}"
  }
}  

/************ CREATING SECRETS MANAGER **********************/	  

resource "aws_secretsmanager_secret" "mysql_connection" {
  description         = "${var.secret_description}"
  name                = "${var.secretesmanger_name}"
  tags = "${merge(local.tags, map("Name", "${var.secretesmanger_name}"))}"
}

/************ CREATING SECRETS MANAGER_VERSION **********************/
resource "aws_secretsmanager_secret_version" "secret" {
  secret_id     = "${aws_secretsmanager_secret.mysql_connection.id}"
  secret_string = <<EOF
{
  "username": "${var.mysql_username}",
  "engine": "${var.engine}",
  "dbname": "${var.dbname}",
  "host": "${var.mysql_host}",
  "password": "${var.dbpassword}",
  "port": "${var.port}",
  "dbInstanceIdentifier": "${var.mysql_dbInstanceIdentifier}"
}
EOF
}





