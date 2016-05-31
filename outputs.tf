output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_subnet" {
  value = "${aws_subnet.public.id}"
}

output "private_subnet" {
  value = "${aws_subnet.private.id}"
}

output "db_subnets" {
  value = "${aws_subnet.database.id}"
}
