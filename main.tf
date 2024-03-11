module "services" {
    source = "./modules/elz_services/"

    enable_s3   = true
    enable_ec2  = false
    enable_eks  = false
}
