provider "aws" {
  region = "eu-central-1" # Це Франкфурт (найближче до нас, пінг буде мінімальним)
  # Фейкові ключі для LocalStack (він приймає будь-які значення)
  access_key                  = "test"
  secret_key                  = "test"
  
  # Кажемо Terraform не перевіряти реальність ключів
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  # Перенаправляємо запити до сервісу EC2 на наш локальний контейнер
  endpoints {
    ec2 = "http://localhost:4566"
  }  
}

# # 1. Просимо Terraform знайти найсвіжіший офіційний образ Ubuntu 22.04
# data "aws_ami" "latest_ubuntu" {
#   most_recent = true
#   owners      = ["099720109477"] # Це офіційний ID акаунта компанії Canonical (творців Ubuntu) в AWS

#   filter {
#     name   = "name"
#     values =["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }
# }

# 2. Створюємо сервер, використовуючи знайдений ID
resource "aws_instance" "core_collector" {
  # Тепер ми не пишемо ID руками, а беремо його з блоку data!
  # ami           = data.aws_ami.latest_ubuntu.id 
  ami           = "ami-01e444924a2233b07"
  instance_type = "t2.micro"

  tags = {
    Name        = "OmniLog-Collector"
    Environment = "Dev"
    Project     = "OmniLog AI"
  }
}