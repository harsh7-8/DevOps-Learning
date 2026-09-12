output "instance_details" {
  value = {
    for k, v in aws_instance.wmp_instances : k => {
      id         = v.id
      private_ip = v.private_ip
      public_ip  = v.public_ip
      name       = v.tags["Name"]
    }
  }
}