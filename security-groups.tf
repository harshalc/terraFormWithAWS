resource "aws_security_group" "nat" {
    name = "vpc_nat"
    description = "Can access both subnets"

    # Inbound HTTp from anywhere
    ingress {
        from_port = 80
        to_port   = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port   = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port   = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }


    vpc_id = "${aws_vpc.main_vpc.id}"

    tags = {
        Name = "NATSG"
    }
}

resource "aws_security_group" "web" {
    name = "vpc_web"
    description = "Allow incoming HTTP connections."


    # Inbound HTTp from anywhere
    ingress {
        from_port = 80
        to_port   = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port   = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port   = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }


    vpc_id = "${aws_vpc.main_vpc.id}"

    tags = {
        Name = "WebServerSG"
    }
}

resource "aws_security_group" "db" {
    name = "vpc_db"
    description = "Allow incoming database connections."

    ingress { # MySQL
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = ["${aws_security_group.web.id}"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }

    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    vpc_id = "${aws_vpc.main_vpc.id}"

    tags = {
        Name = "DBServerSG"
    }
}
