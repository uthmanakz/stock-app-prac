provider "aws" {
    region = "eu-west-2"
}
resource "aws_instance" "web_ubuntu" {
    ami = "ami-091f18e98bc129c4e"
    instance_type = "t2.micro"
    key_name = "uthmanakz"
    tags = {
        Name = "web-ubuntu"
        dev = "web"
        OS = "ubuntu"
    }
}

resource "aws_instance" "web_amazon" {
    ami = "ami-00710ab5544b60cf7"
    instance_type = "t2.micro"
    key_name = "uthmanakz"

     tags = {
        Name = "web-amazon"
        dev = "web"
        OS = "amazon"
    }
}

resource "aws_instance" "ansible" {
    ami = "ami-00710ab5544b60cf7"
    instance_type = "t2.micro"
    key_name = "uthmanakz"

     tags = {
        Name = "ansible"
    }
}

resource "aws_instance" "app_ubuntu" {
    ami = "ami-091f18e98bc129c4e"
    instance_type = "t2.micro"
    key_name = "uthmanakz"
    tags = {
        Name = "app-ubuntu"
        dev = "app"
        OS = "ubuntu"
    }
}

resource "aws_instance" "app_amazon" {
    ami = "ami-00710ab5544b60cf7"
    instance_type = "t2.micro"
    key_name = "uthmanakz"

     tags = {
        Name = "app-amazon"
        dev = "app"
        OS = "amazon"
    }
}


resource "aws_instance" "prometheus" {
    ami = "ami-00710ab5544b60cf7"
    instance_type = "t2.micro"
    key_name = "uthmanakz"

     tags = {
        Name = "prometheus"
        dev = "monitor"
    }
}
