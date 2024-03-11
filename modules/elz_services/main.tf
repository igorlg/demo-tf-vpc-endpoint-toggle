locals {
    vpc_endpoints = {
        s3      = var.enable_s3  || var.enable_eks
        kms     = var.enable_s3  || var.enable_ec2
        ec2     = var.enable_ec2 || var.enable_eks
        sts     = var.enable_ec2 || var.enable_eks
        eks     = var.enable_eks
        ecr     = var.enable_eks
        elb     = var.enable_eks
        xray    = var.enable_eks
        logs    = var.enable_eks
    }
}

resource "aws_vpc_endpoint" "interface" {
    for_each = { for k, v in local.vpc_endpoints :  k => v if v }

    service_name = "com.amazonaws.${data.aws_region.current.name}.${each.key}"

    vpc_id = data.aws_vpc.default.id
    security_group_ids = [ data.aws_security_group.default.id ]
    subnet_ids = data.aws_subnets.private.ids

    vpc_endpoint_type = "Interface"
    private_dns_enabled = true
}
