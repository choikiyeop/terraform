module "db" {
  source  = "terraform-aws-modules/rds/aws"

  identifier = "demodb"
  
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t3a.small"
  allocated_storage = 5

  db_name = "demodb"
  username = "user"
  port = "3306"

  iam_database_authentication_enabled = true

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window = "03:00-06:00"

  
}
