resource "aws_iam_role" "this" {
  name = "${var.name}-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      }
    ]
  })
}

resource "aws_iam_policy" "this" {
  name        = "${var.name}-ssm-policy"
  description = "Policy to allow SSM actions"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ssm:StartSession",
          "ssm:SendCommand",
          "ssm:ListCommands",
          "ssm:ListCommandInvocations",
          "ssm:DescribeInstanceInformation",
          "ssm:DescribeDocument",
          "ssm:GetConnectionStatus",
          "ssm:CreateDocument",
          "ssm:DeleteDocument",
          "ssm:UpdateDocument",
          "ssm:GetDocument",
          "ssm:SendCommand",
          "ssm:ListDocuments",
          "ssm:GetDeployablePatchSnapshotForInstance",
          "ssm:ListAssociations",
          "ssm:ListInstanceAssociations",
          "ssm:ListInstanceInventory",
          "ssm:ListInventoryEntries",
          "ssm:PutInventory",
          "ssm:PutConfigurePackageResult",
          "ssm:UpdateInstanceInformation",
          "ec2messages:GetEndpoint",
          "ec2messages:SendReply",
          "ec2messages:SendCommand",
          "ssmmessages:CreateControlChannel",
          "ssmmessages:CreateDataChannel",
          "ssmmessages:OpenControlChannel",
          "ssmmessages:OpenDataChannel"
        ]
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = "logs:*"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}