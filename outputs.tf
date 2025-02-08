output "instance_public_ip" {
  description = "Ec2 public ip for web page"
  value       = aws_instance.My_webserver.public_ip

}
output "instance_url" {
  description = "URL"
  value       = "http://${aws_instance.My_webserver.public_ip}"

}