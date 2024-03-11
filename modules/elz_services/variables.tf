variable enable_s3 {
    type        = bool
    default     = false
    description = "Enable S3 service in this account"
}

variable enable_ec2 {
  type        = bool
  default     = false
  description = "Enable EC2 service in this account"
}

variable enable_eks {
  type        = bool
  default     = false
  description = "Enable EKS service in this account"
}
