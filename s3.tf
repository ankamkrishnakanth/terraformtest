resource "aws_s3_bucket" "flow" {
  bucket = "my-tf-flow-bucket-krishna"
  acl    = "private"

  tags = {
    Name        = "Terraform state krishna bucket"
    Environment = "Dev"
  }
  depends_on = [
    aws_vpc.myvpc,
  ]
}
