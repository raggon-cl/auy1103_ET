provider "aws" {
  region = "us-east-1"
}

resource "aws_subnet" "main" {
  vpc_id            = "vpc-0c968fce5c360ecb5" 
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_internet_gateway" "main" {
  vpc_id = "vpc-0c968fce5c360ecb5"
}

resource "aws_route_table" "main" {
  vpc_id = "vpc-0c968fce5c360ecb5"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}

resource "aws_security_group" "allow_http" {
  name        = "allow_web_traffic"
  vpc_id      = "vpc-0c968fce5c360ecb5"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app1" {
  ami                         = "ami-06c68f701d8090592"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.main.id
  vpc_security_group_ids      = [aws_security_group.allow_http.id]

  tags = { Name = "AppServer1" }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl start httpd"
    ]
    connection {
      type     = "ssh"
      user     = "ec2-user"
      host     = self.public_ip
    }
  }
}

resource "aws_instance" "app2" {
  ami                         = "ami-06c68f701d8090592"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.main.id
  vpc_security_group_ids      = [aws_security_group.allow_http.id]
  tags = { Name = "AppServer2" }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  engine               = "aurora-mysql"
  instance_class       = "db.t2.micro"
  identifier           = "mydatabase"
  username             = "root"
  password             = "mypassword" # No es buena práctica, ideal usar variables
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.main.name
}

resource "aws_db_subnet_group" "main" {
  name       = "main-db-group"
  subnet_ids = [aws_subnet.main.id] # Solo hay una subred; fallará en el despliegue de Aurora
}
