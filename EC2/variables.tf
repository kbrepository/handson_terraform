variable "ingress_rules" {
  default = [{
       from_port   = 443
       to_port     = 443
       description = "Port 443"
   },
   {
       from_port   = 80
       to_port     = 80
       description = "Port 80"
   }]
}

variable "ami" {
  description = "You can either choose the 2019 or the 2016 image or the linux image."
  default     = "2019"
}

variable "default_ami" {
  type = map(any)
  default = {
    "linux" = {
      name = "*"
      ami_id = "*"
    },
    "2016" = {
      name = "WIN2016-CUSTOM*"
      ami_id = "*"
    },
    "2019" = {
      name = "WIN2019-CUSTOM*"
      ami_id = "*"
    }
  }
}