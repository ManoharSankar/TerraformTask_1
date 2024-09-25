# Define provider for AWS with alias for different regions
provider "aws" {
  region = "ap-south-1"
  alias  = "ap-south"
}

provider "aws" {
  region = "ap-southeast-1"
  alias  = "ap-southeast"
}

# Create an EC2 instance in south region
resource "aws_instance" "south_instance" {
  provider          = aws.ap-south
  ami               = "ami-0522ab6e1ddcc7055"
  instance_type     = "t2.micro"
  key_name          = "K8s"

  tags = {
    Name = "Mumbai-instance"
  }
}

# Create an EC2 instance in southeast region
resource "aws_instance" "southeast_instance" {
  provider          = aws.ap-southeast
  ami               = "ami-01811d4912b4ccb26"
  instance_type     = "t2.micro"
  key_name          = "K8s"

  tags = {
    Name = "Singapore-instance"
  }
}

# Output the instance IDs and public IPs
output "south_instance_id" {
  description = "EC2 instance ID in ap-south-1"
  value       = aws_instance.south_instance.id
}

output "south_instance_public_ip" {
  description = "EC2 instance public IP in ap-south-1"
  value       = aws_instance.south_instance.public_ip
}

output "southeast_instance_id" {
  description = "EC2 instance ID in ap-southeast-1"
  value       = aws_instance.southeast_instance.id
}

output "southeast_instance_public_ip" {
  description = "EC2 instance public IP in ap-southeast-1"
  value       = aws_instance.southeast_instance.public_ip
}
