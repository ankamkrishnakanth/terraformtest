resource "null_resource" "cluster" {
    count = var.env == "prod" ? 2 : 1
    provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
    connection {
     type = "ssh"
     user = "ubuntu"
     private_key = file("krishna.pem")
     timeout = "2m"
     #agent = true
     #host = aws_instance.web-1.*.public_ip
     host = element(aws_instance.web-1.*.public_ip, count.index)
     #host = self.public_ip
  }
    }
#   provisioner "remote-exec" {
#        inline = [
#            "mkdir newdir",
#            "export env=dev"
#        ]
#   }  
}
