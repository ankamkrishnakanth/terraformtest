resource "aws_flow_log" "vpcflow" {
  log_destination      = aws_s3_bucket.flow.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.myvpc.id
}
