
resource "aws_instance" "web-1" {
    count = var.env == "prod" ? 2 : 1
    ami = lookup(var.amis, var.region)
    instance_type = "t2.micro"
    key_name = "krishna"
    subnet_id = element(aws_subnet.public-subnets.*.id, count.index)
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true	
    user_data = <<-EOF
		#!/bin/bash
    sudo apt-get update
		sudo apt-get install -y nginx
		sudo systemctl start nginx
		sudo systemctl enable nginx
		echo "<h1>Server-${count.index+1}</h1>" | sudo tee /var/www/html/index.nginx-debian.html
	EOF

  tags = {
        Name = "Server-${count.index+1}"
        Env = var.env
        Owner = "Sree"
	CostCenter = "ABCD"
    }
  #    lifecycle {
  #   create_before_destroy = true
  #   prevent_destroy = false
  #    ignore_changes = [
  #     # Ignore changes to tags, e.g. because a management agent
  #     # updates these based on some ruleset managed elsewhere.
  #     tags,
  #   ]
  # }


}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "${aws_vpc.myvpc.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    }
}
