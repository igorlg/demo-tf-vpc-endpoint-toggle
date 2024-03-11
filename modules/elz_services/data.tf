# data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_vpc" "default" {
    default = true
}

data "aws_security_group" "default" {
    name = "default"
    vpc_id = data.aws_vpc.default.id
}

data "aws_subnets" "private" {
    filter {
        name   = "vpc-id"
        values = [data.aws_vpc.default.id]
    }

    filter {
        name   = "default-for-az"
        values = ["true"]
    }
}
