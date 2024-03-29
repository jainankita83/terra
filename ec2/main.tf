terraform {
    required_version = ">= 0.11.0"
}

provider "aws" {
    region = "${var.aws_region}"
}

resource "aws_instance" "jenkins-server" {
    ami = "${var.ami_id}"
    instance_type = "${var.instance_type}"
    key_name = "${var.aws_key}"
    count = 2



tags {
    Name = "${var.name}"
}


}



# resource "aws_instance" "harness-delegate" {
#     ami = "${var.ami_id}"
#     instance_type = "${var.instance_large}"
#     key_name = "${var.aws_key}"
#     count = 1

#     tags {
#         Name = "${var.delegate}"

#     }
# }