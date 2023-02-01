data "aws_iam_policy_document" "main" {

  statement {
    effect = "Allow"
    principals {
      identifiers = ["backup.amazonaws.com"]
      type        = "Service"
    }
    actions = ["sts:AssumeRole"]
  }
}
