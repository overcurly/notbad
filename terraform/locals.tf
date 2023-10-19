locals {
  name =  "notbad"
  region = "eu-north-1"
  ingress_rules = [
    {
      name        = "HTTP"
      port        = 8089
      description = "Ingress rules for port 8089"
    },
    {
      name        = "HTTP"
      port        = 80
      description = "Ingress rules for port 80"
    },
    {
      name        = "HTTP"
      port        = 16443
      description = "Ingress rules for k8s api server"
    },
    {
      name        = "SSH"
      port        = 22
      description = "Ingress rules for port 22"
    }]

}