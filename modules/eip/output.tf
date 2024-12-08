output "ajay_eip_allocation_id" {
  value = aws_eip.ajay_eip_for_ngw.allocation_id
}
output "ajay_eip_association_id" {
  value = aws_eip.ajay_eip_for_ngw.association_id
}

output "ajay_eip_id" {
  value = aws_eip.ajay_eip_for_ngw.id
}