env                       = "test"
region                    = "ap-south-1"
project                   = "hire"
name                      = "node-app"
vpc_cidr                  = "10.0.0.0/16"
private_subnet_1_cidr     = "10.0.10.0/24"
private_subnet_2_cidr     = "10.0.11.0/24"
public_subnet_1_cidr      = "10.0.1.0/24"
public_subnet_2_cidr      = "10.0.2.0/24"
URL                       = "https://test"
secret_arn                = "arn:aws:secretsmanager:ap-south-1:637423357784:secret:node-app-l3FQdP"
http_ingress_cidr_blocks  = ["93.174.85.223/32"]
https_ingress_cidr_blocks = ["93.174.85.223/32"]
hosted_zone_id            = "Z01826962DLG7GTIHZO1Q"
domain_name               = "node-app.demoprojectbc1.com"
log_bucket_name           = "node-app-network-logs"
enable_s3_logs            = false
waf_name                  = "node-app-waf"