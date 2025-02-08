#create Ec2 inctance and launch web page
resource "aws_instance" "My_webserver" {
  ami                         = var.ec2_image
  vpc_security_group_ids      = [aws_security_group.ec2-securitygrp.id]
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public-subnet.id
  user_data                   = <<-EOF
#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to My Website</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 1em;
        }
        main {
            padding: 20px;
        }
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 1em;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>

    <header>
        <h1>Welcome to My Website</h1>
    </header>

    <main>
        <h2>About Me</h2>
        <p>This is a simple web page to test the Apache server setup on your EC2 instance. You can customize it with more content and styling!</p>
    </main>

    <footer>
        <p>&copy; 2025 My Website</p>
    </footer>

</body>
</html>" > /var/www/html/index.html

sudo systemctl restart httpd
EOF
  tags = {
    Name = "My_webserver"
  }
}

