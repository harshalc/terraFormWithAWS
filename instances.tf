resource "aws_instance" "nat" {
    ami = "ami-0ce933e2ae91880d3"
    availability_zone = "ap-south-1a"
    instance_type = "t2.micro"
    key_name = "harshal-dec-19"

    vpc_security_group_ids = ["${aws_security_group.nat.id}"]
    user_data = <<-EOF
                #!/bin/bash
                yum install httpd -y
                echo  "welcome " > /var/www/html/index.html
                yum update -y
                service httpd start
                EOF
    tags = {
        Name = "Web"
    }
}

resource "aws_instance" "web-1" {
    ami = "${lookup(var.amis, var.aws_region)}"
    availability_zone = "ap-south-1a"
    instance_type = "t2.micro"
    key_name = "harshal-dec-19"
    vpc_security_group_ids = ["${aws_security_group.web.id}"]


user_data = <<-EOF
                #!/bin/bash
                yum install httpd -y
                echo  "welcome " > /var/www/html/index.html
                yum update -y
                service httpd start
                EOF

    tags = {
        Name = "Web Server 1"
    }
}

resource "aws_instance" "db-1" {
    ami = "${lookup(var.amis, var.aws_region)}"
    availability_zone = "ap-south-1a"
    instance_type = "t2.micro"
    key_name = "harshal-dec-19"
    vpc_security_group_ids = ["${aws_security_group.db.id}"]
    subnet_id = "${aws_subnet.ap-south-1a-private.id}"
    source_dest_check = false

    tags = {
        Name = "DB Server 1"
    }
}
