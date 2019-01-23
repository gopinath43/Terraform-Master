# Below are the WEB01 security group details:

resource "aws_security_group" "WEB01_SG" {
  vpc_id      = "${aws_vpc.main.id}"
  name        = "WEB01_SG"
  description = "security group inbound and outbound traffic for WEB01 instance"

ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "WEB01_SG"
  }
}

# Below are the APP01 security group details:

resource "aws_security_group" "APP01_SG" {
  vpc_id      = "${aws_vpc.main.id}"
  name        = "APP01_SG"
  description = "security group inbound and outbound traffic for APP01 instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
     from_port   = 80
     to_port     = 80
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
     from_port   = 443
     to_port     = 443
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
     from_port   = 0
     to_port     = 65535
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
  }
  
 ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    security_groups = ["${aws_security_group.WEB01_SG.id}"]
  }
 egress {
     from_port   = 3306
     to_port     = 3306
     protocol    = "tcp"
     security_groups = ["${aws_security_group.DB01_SG.id}"]
  }
  egress {
     from_port   = 22
     to_port     = 22
     protocol    = "tcp"
     security_groups = ["${aws_security_group.DB01_SG.id}"]
  }
   egress {
     from_port   = 80
     to_port     = 80
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
  }
   egress {
     from_port   = 443
     to_port     = 443
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "APP01_SG"
  }
}

# Below are the AM01 security group details:

resource "aws_security_group" "AM01_SG" {
  vpc_id      = "${aws_vpc.main.id}"
  name        = "AM01_SG"
  description = "security group inbound traffic for AM01 instance"
  
ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   tags = {
    Name = "AM01_SG"
  }
}  

# Below are the DB01 security group details:

resource "aws_security_group" "DB01_SG" {
  vpc_id      = "${aws_vpc.main.id}"
  name        = "DB01_SG"
  description = "security group inbound traffic for DB01 instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = ["${aws_security_group.APP01_SG.id}"]
  }

egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

egress {
     from_port   = 0
     to_port     = 65535
     protocol    = "tcp"
	 security_groups = ["${aws_security_group.APP01_SG.id}"]
  }
  
  tags = {
    Name = "DB01_SG"
  }
}

  
