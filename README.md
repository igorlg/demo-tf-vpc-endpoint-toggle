# Enable AWS services in ELZ Customer Accounts

Simply import the `elz_services` module once per AWS account, and pass arguments `enable_<service>` for each AWS service you wish to enable.

e.g.

```
module "services" {
    source = "./modules/elz_services/"

    enable_s3   = true
    enable_ec2  = true
}
```

or

```
module "services" {
    source = "./modules/elz_services/"

    enable_eks  = true
}
```

The module will create the necessary VPC Interface endpoints required by each AWS service in the Default VPC.
