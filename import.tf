# resource "aws_instance" "web-32" {
#     ami = "ami-0756a1c858554433e"
#     instance_type = "t2.micro"
#     key_name = "ekskey"
#     subnet_id = "subnet-0df256082df2fb731"
#     vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
#     associate_public_ip_address = true	
#   tags = {
#         Name = "Server-32"
#     }
#   }

