module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 2.0"

  identifier = "charles-training-rds"

  engine            = "postgres"
  engine_version    = "9.6.9"
  instance_class    = "db.t2.micro"
  allocated_storage = "10"
  storage_encrypted = false

  name     = "zup"
  username = "zup"
  password = "123zup123"
  port     = "5432"

  vpc_security_group_ids    = [var.security_group_id]
  create_db_parameter_group = false

  major_engine_version = "9.6"
  family               = "postgres9.6"

  maintenance_window = "Thu:03:30-Thu:05:30"
  backup_window      = "05:30-06:30"

  multi_az = false

  #subnet_ids = flatten(chunklist(var.subnets.private_subnet.*.id, 1))
  subnet_ids = var.subnets
}

output "database_endpoint" {
  value = module.rds.this_db_instance_endpoint
}

output "region" {
  description = "AWS region."
  value       = var.region
}
#TODO: include the other vpc and group