# Terraform setting
environment = "dev"
region      = "ap-northeast-2"

tags = {
  MadeBy = "imok"
}

# Project name
name = "T101"

# Network setting 
vpc_cidr = "10.60.0.0/16"

az_names = [
  "ap-northeast-2a",
  "ap-northeast-2c"
]

public_subnets = {
  pub_sub_2a = {
    zone = "ap-northeast-2a"
    cidr = "10.60.0.0/24"
  },
  pub_sub_2c = {
    zone = "ap-northeast-2c"
    cidr = "10.60.1.0/24"
  }
}
