provider "aws" {
  region = "eu-central-1" # Це Франкфурт (найближче до нас, пінг буде мінімальним)
}

# 1. Просимо Terraform знайти найсвіжіший офіційний образ Ubuntu 22.04
data "aws_ami" "latest_ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Це офіційний ID акаунта компанії Canonical (творців Ubuntu) в AWS

  filter {
    name   = "name"
    values =["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# 2. Створюємо сервер, використовуючи знайдений ID
resource "aws_instance" "core_collector" {
  # Тепер ми не пишемо ID руками, а беремо його з блоку data!
  ami           = data.aws_ami.latest_ubuntu.id 
  instance_type = "t2.micro"

  tags = {
    Name        = "OmniLog-Collector"
    Environment = "Dev"
    Project     = "OmniLog AI"
  }
}