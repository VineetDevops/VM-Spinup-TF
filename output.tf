
output "public_ip" {
     value = module.publicip.*.public_ip_address

 }
