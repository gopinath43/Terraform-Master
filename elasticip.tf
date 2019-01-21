resource "aws_eip" "WEB01eip" {
  instance = "${aws_instance.WEB01.id}"
}
