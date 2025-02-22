provider "aws" {
    region = "eu-west-2"
}
resource "aws_instance" "web_ubuntu" {
    ami = "ami-091f18e98bc129c4e"
    instance_type = "t2.micro"
    key_name = "simbababy"
}

resource "aws_instance" "web_amazon" {
    ami = "ami-00710ab5544b60cf7"
    instance_type = "t2.micro"
    key_name = "simbababy"
}

resource "aws_instance" "ansible" {
    ami = "ami-00710ab5544b60cf7"
    instance_type = "t2.micro"
    key_name = "simbababy"
}