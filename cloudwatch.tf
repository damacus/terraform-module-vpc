resource "aws_flow_log" "vpc_flow_log" {
  count           = var.enable_flow_logs ? 1 : 0
  log_destination = aws_cloudwatch_log_group.vpc_flow_log[count.index].arn
  iam_role_arn    = aws_iam_role.vpc_flow_log[count.index].arn
  vpc_id          = aws_vpc.vpc.id
  traffic_type    = "ALL"
  depends_on      = [aws_cloudwatch_log_group.vpc_flow_log]
}

resource "aws_cloudwatch_log_group" "vpc_flow_log" {
  count             = var.enable_flow_logs ? 1 : 0
  name              = "vpc_flow_log_${terraform.workspace}"
  retention_in_days = var.flow_log_retention_period
  tags              = merge(local.tags, { "Name" = "vpc_flow_log_${terraform.workspace}" })
}
