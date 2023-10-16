##########################################################################################

# Creating EC2 Instance:

##########################################################################################

resource "aws_instance" "instance" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  subnet_id            = aws_subnet.public_subnet[0].id
  vpc_security_group_ids = [aws_security_group.sg.id, ]
  key_name             = "mali-key"

  tags = {
    "Name"        = "Instance"
    "Environment" = "NotBad"
    "CreatedBy"   = "Terraform"
  }

  timeouts {
    create = "10m"
  }

}




############################################################################################

# Creating 3 Elastic IPs:

############################################################################################

resource "aws_eip" "eip" {
  count            = length(aws_instance.instance.*.id)
  instance         = element(aws_instance.instance.*.id, count.index)
  public_ipv4_pool = "amazon"

  tags = {
    "Name" = "EIP-${count.index}"
  }
}

############################################################################################

# Creating EIP association with EC2 Instances:

############################################################################################

resource "aws_eip_association" "eip_association" {
  count         = length(aws_eip.eip)
  instance_id   = element(aws_instance.instance.*.id, count.index)
  allocation_id = element(aws_eip.eip.*.id, count.index)
}

resource "local_file" "hosts_cfg" {
  content = templatefile("inventory.tmpl",
    {
      ubuntu_hosts = aws_eip.eip.*.public_ip
    }
  )
  filename = "../ansible/inventory"
}