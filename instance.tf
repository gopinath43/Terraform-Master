# Below are the WEB01 instance details:

resource "aws_instance" "WEB01" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  tags = {
    Name = "WEB01"
  }

  # the VPC subnet
  subnet_id = "${aws_subnet.web.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.WEB01_SG.id}"]

  # the public SSH key
    key_name = "${aws_key_pair.mykeypair.key_name}"
}

# Below are the ANSIBLE-MASTER instance details:

resource "aws_instance" "ANSIBLE-MASTER" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  tags = {
    Name = "ANSIBLE-MASTER"
  }

  # the VPC subnet
  subnet_id = "${aws_subnet.web.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.AM01_SG.id}"]

  # the public SSH key
    key_name = "${aws_key_pair.mykeypair.key_name}"
}

# Below are the APP01 instance details:

resource "aws_instance" "APP01" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  tags = {
    Name = "APP01"
  }

  # the VPC subnet
  subnet_id = "${aws_subnet.app.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.APP01_SG.id}"]

  # the public SSH key
    key_name = "${aws_key_pair.mykeypair.key_name}"
}

# Below are the DB01 instance details:

resource "aws_instance" "DB01" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  tags = {
    Name = "DB01"
  }

  # the VPC subnet
  subnet_id = "${aws_subnet.db.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.DB01_SG.id}"]

  # the public SSH key
    key_name = "${aws_key_pair.mykeypair.key_name}"
}
